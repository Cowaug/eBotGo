package com.ebot.ebotgo;

import org.apache.commons.codec.binary.Hex;
import org.springframework.stereotype.Repository;

import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;
import java.net.URI;
import java.net.URISyntaxException;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.sql.*;

@Repository
public class CodeBaseSQL {
    private final byte[] SALT = System.getenv("SALT_CRYPTO").getBytes();
    private final String SKF = System.getenv("SKF");
    private Connection connection = null;

    {
        System.out.println("Connecting to database");
        try {
            URI jdbUri = new URI(System.getenv("JAWSDB_URL"));
            while (connection == null) {
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    String jdbUrl = "jdbc:mysql://" + jdbUri.getHost() + ":" + jdbUri.getPort() + jdbUri.getPath();
                    connection = DriverManager.getConnection(jdbUrl, jdbUri.getUserInfo().split(":")[0], jdbUri.getUserInfo().split(":")[1]);
                    System.out.println("Connection to database initialed!");
                } catch (SQLException | ClassNotFoundException e) {
                    System.out.println(".");
                    System.out.println(e.getMessage());
                }
            }
        } catch (URISyntaxException e) {
            System.out.println(e.getMessage());
        }
    }

    public User login(String userId, String password)  {
        try (Statement st = connection.createStatement()) {
            ResultSet rs = st.executeQuery("select username,permission from ebotgo_users where userId = '" + userId + "' and password = '" + hashPassword(password.toCharArray(), SALT) + "'");
            return rs.next()? new User(userId,rs.getString(1), Integer.parseInt(rs.getString(2))):null;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }


    /**
     * For creating default account in database
     *
     * @return Hashed password
     */
    public String hash(String password) {
        return hashPassword(password.toCharArray(), SALT);
    }

    private String hashPassword(final char[] password, final byte[] salt) {
        try {
            SecretKeyFactory skf = SecretKeyFactory.getInstance(SKF);
            PBEKeySpec spec = new PBEKeySpec(password, salt, 1024, 1024);
            SecretKey key = skf.generateSecret(spec);
            byte[] res = key.getEncoded();
            return Hex.encodeHexString(res);
        } catch (NoSuchAlgorithmException | InvalidKeySpecException e) {
            throw new RuntimeException(e);
        }
    }
}
