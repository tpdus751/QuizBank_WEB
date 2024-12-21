package kr.ac.kopo.mybatis;

import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MyConfig {

    private SqlSession session;

    public MyConfig() {
        String resource = "kr/ac/kopo/mybatis/mybatis-config.xml";
        try {
            InputStream inputStream = Resources.getResourceAsStream(resource);
            if (inputStream == null) {
                throw new IllegalStateException("MyBatis 설정 파일을 찾을 수 없습니다: " + resource);
            }
            SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
            if (sqlSessionFactory == null) {
                throw new IllegalStateException("SqlSessionFactory가 초기화되지 않았습니다.");
            }
            session = sqlSessionFactory.openSession(true);
            if (session == null) {
                throw new IllegalStateException("SqlSession이 생성되지 않았습니다.");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public SqlSession getInstance() {
        return session;
    }
}

