package com.ebot.ebotgo;

import org.apache.commons.codec.binary.Hex;

import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;
import java.net.URI;
import java.net.URISyntaxException;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.sql.*;
import java.util.Random;


/**
 * Add functionality to reboot the bot on heroku without clearing user data
 */
public class JawMySQL {
    private static byte[] SALT = System.getenv("SALT_CRYPTO").getBytes();
    private static String SKF = System.getenv("SKF");
    private static Connection connection = null;

    static {
        System.out.println("Connecting to database");
        try {
            URI jdbUri = new URI(System.getenv("JAWSDB_URL"));
            while (connection == null) {
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    String jdbUrl = "jdbc:mysql://" + jdbUri.getHost() + ":" + jdbUri.getPort() + jdbUri.getPath();
                    connection = DriverManager.getConnection(jdbUrl, jdbUri.getUserInfo().split(":")[0], jdbUri.getUserInfo().split(":")[1]);
                    System.out.println("Connection to database initialed!");
                    System.out.println(connection);
                } catch (SQLException | ClassNotFoundException e) {
                    System.out.println(e.getMessage());
                }
            }
        } catch (URISyntaxException e) {
            System.out.println(e.getMessage());
        }
    }

    protected static String login(String userId, String password) throws SQLException {
        Statement st = connection.createStatement();
        ResultSet rs = st.executeQuery("select username from ebotgo_users where userId = '" + userId + "' and password = '" + hashPassword(password.toCharArray(), SALT, 1024, 1024) + "'");
//       ResultSet rs = st.executeQuery("select username from ebotgo_user where userId = '" + userId + "' and passwords = '" + password + "'");
        rs.next();
        return rs.getString(1);
    }

    protected static String resetPassword(String userId, String registeredEmail) throws SQLException {
        Statement st = connection.createStatement();
        Random random = new Random();
        String password = String.valueOf(random.nextLong()).replace("-", "");
        return st.execute("update ebotgo_users set password ='" + hashPassword(password.toCharArray(), SALT, 1024, 1024) +
                "' where userId = '" + userId + "' and email = '" + registeredEmail + "'") ? null : password;
    }

    protected static boolean changePassword(String userId, String oldPassword, String newPassword) throws SQLException {
        Statement st = connection.createStatement();
        return st.execute("update ebotgo_users set password ='" + hashPassword(newPassword.toCharArray(), SALT, 1024, 1024) +
                "' where userId = '" + userId + "' and password = '" + hashPassword(oldPassword.toCharArray(), SALT, 1024, 1024) + "'"); //is error
    }

    /**
     * For creating default account in database
     *
     * @return Hash password
     */
    public static String hash(String password) {
        return hashPassword(password.toCharArray(), SALT, 1024, 1024);
    }

    private static String hashPassword(final char[] password, final byte[] salt, final int iterations, final int keyLength) {
        try {
            SecretKeyFactory skf = SecretKeyFactory.getInstance(SKF);
            PBEKeySpec spec = new PBEKeySpec(password, salt, iterations, keyLength);
            SecretKey key = skf.generateSecret(spec);
            byte[] res = key.getEncoded();
            return Hex.encodeHexString(res);
        } catch (NoSuchAlgorithmException | InvalidKeySpecException e) {
            throw new RuntimeException(e);
        }
    }
}