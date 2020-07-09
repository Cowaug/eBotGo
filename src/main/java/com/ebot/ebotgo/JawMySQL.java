package com.ebot.ebotgo;

import org.apache.commons.codec.binary.Hex;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.util.Random;

@Repository
public class JawMySQL {
    @Autowired
    SqlSession sqlSession;

    @Autowired
    CodeBaseSQL codeBaseSQL;

    private static final byte[] SALT = System.getenv("SALT_CRYPTO").getBytes();
    private static final String SKF = System.getenv("SKF");

    public User login(String userId, String password) {
        return sqlSession.selectOne("UserMapper.login", new Object[]{userId, hash(password)});
    }

    public User login2(String userId, String password) {
        return sqlSession.selectOne("UserMapper.login2", new Object[]{userId, hash(password)});
    }

    public User login3(String userId, String password) {
        return sqlSession.selectOne("UserMapper.login3", new Object[]{userId, hash(password)});
    }

    public User login4(String userId, String password) {
        return codeBaseSQL.login(userId,password);
    }

    public String resetPassword(String userId, String registeredEmail) {
        Random random = new Random();
        String password = String.valueOf(random.nextLong()).replace("-", "");
        return sqlSession.update("UserMapper.resetPassword", new Object[]{hash(password), userId, registeredEmail}) == 1 ? null : password;
    }

    public int changePassword(String userId, String oldPassword, String newPassword) {
        return sqlSession.update("UserMapper.changePassword", new Object[]{hash(newPassword), userId, hash(oldPassword)});
    }

    /**
     * For creating default account in database
     *
     * @return Hashed password
     */
    public static String hash(String password) {
        return hashPassword(password.toCharArray());
    }

    private static String hashPassword(final char[] password) {
        try {
            SecretKeyFactory skf = SecretKeyFactory.getInstance(SKF);
            PBEKeySpec spec = new PBEKeySpec(password, JawMySQL.SALT, 1024, 1024);
            SecretKey key = skf.generateSecret(spec);
            byte[] res = key.getEncoded();
            return Hex.encodeHexString(res);
        } catch (NoSuchAlgorithmException | InvalidKeySpecException e) {
            throw new RuntimeException(e);
        }
    }
}