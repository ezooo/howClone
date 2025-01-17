package com.springproject.repository;

import java.util.ArrayList;
import java.util.List;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import com.springproject.domain.Diary;
import com.springproject.exception.DiaryIdException;

@Repository
public class DiaryRepositoryImpl implements DiaryRepository
{
	//db 연결을 위한 설정추가
	private JdbcTemplate template;
	@Autowired
	public void setJdbctemplate(DataSource dataSource)
	{
		this.template = new JdbcTemplate(dataSource);
	}
	String SQL;
	//db설정end
	
	public DiaryRepositoryImpl()
	{
		System.out.println("DiaryRepositoryImpl 생성자 함수 호출 - 다이어리 담을 맵 만들기");
	}
	
	@Override
	public void setNewDiary(Diary diary) 
	{	
		System.out.println("DiaryRepositoryImpl setNewDiary in");
		
		SQL = "insert into diary values(?,?,?,?,?,?,?,?,?,?,?)";
		template.update(SQL, diary.getDiaryId(), diary.getUserId(), diary.getVisit_date(), diary.getVisit_location(), diary.getAddress(), 
				diary.getVisit_diary(), diary.getFilename0(), diary.getFilename1(), diary.getFilename2(), diary.getFilename3(), diary.getIsopen());
		
		System.out.println("setNewDiary 쿼리 업데이트 완료");
	}

	@Override
	public List<Diary> getAllDiary() 
	{
		System.out.println("DiaryRepositoryImpl getAllDiary in");
		
		SQL = "select * from diary where isopen='true'";
		List<Diary> diaries = template.query(SQL, new DiaryRowMapper()); 
		System.out.println("getAllDiary" +diaries);
		return diaries;
	}

	@Override
	public List<Diary> getMyDiary(String userId) 
	{
		System.out.println("DiaryRepositoryImpl getMyDiary in");
		// 회원 아이디에 맞는 다이어리만 가져와야 함
		SQL = "select * from diary where userId=?";
		List<Diary> myDiary = template.query(SQL, new DiaryRowMapper(), new Object[] {userId});
		
		System.out.println("내 다이어리 찾기 완료");
		return myDiary;
	}

	@Override
	public Diary getDiaryById(long diaryId)
	{
		System.out.println("DiaryRepositoryImpl getDiaryById in");
		Diary diaryInfo = null;		//원하는 다이어리 찾으면 여기에 정보담기
		
		String SQL = "select count(*) from diary where diaryId=?";
		int rowCount = template.queryForObject(SQL, Integer.class, diaryId);	//레코드 갯수가 한 개 이상일 때
		if(rowCount != 0)
		{
			System.out.println("DiaryRepositoryImpl getDiaryById rowCount != 0");
			SQL = "select * from diary where diaryId=?";
			diaryInfo = template.queryForObject(SQL, new DiaryRowMapper(), new Object[] {diaryId});
		}
		
		if(diaryInfo == null)
		{
			System.out.println("다이어리 못 찾아서 정보가 비었다");
			throw new DiaryIdException();
		}
		return diaryInfo;
	}

	@Override
	public void setUpdateDiary(Diary diary) 
	{
		System.out.println("DiaryRepositoryImpl setUpdateDiary in");
		SQL = "select count(*) from diary where diaryId=?";
		int row = template.queryForObject(SQL, Integer.class, diary.getDiaryId());
		if(row != 0)
		{
			System.out.println("발견 !");
		}
		SQL = "update diary set visit_date=?, visit_location=?, address=?, visit_diary=?, isopen=? where diaryId=?";
		template.update(SQL, diary.getVisit_date(), diary.getVisit_location(), diary.getAddress(), diary.getVisit_diary(), diary.getIsopen(), diary.getDiaryId());
		System.out.println("이미지 제외하고 수정완료");
		
		System.out.println("setUpdateDiary 파일 이미지도 수정하기");
		String defaultname = "00000000diary.png";
		
		if(diary.getFilename0() != null && !(diary.getFilename0().isEmpty()) && !(diary.getFilename0().equals(defaultname)) ) 
		{
			SQL = "update diary set filename0=? where diaryId=?";
			template.update(SQL, diary.getFilename0(), diary.getDiaryId());
		}
		if(diary.getFilename1() != null && !(diary.getFilename1().isEmpty()) && !(diary.getFilename1().equals(defaultname)) ) 
		{
			SQL = "update diary set filename1=? where diaryId=?";
			template.update(SQL, diary.getFilename1(), diary.getDiaryId());
		}
		if(diary.getFilename2() != null && !(diary.getFilename2().isEmpty()) && !(diary.getFilename2().equals(defaultname)) ) 
		{
			SQL = "update diary set filename2=? where diaryId=?";
			template.update(SQL, diary.getFilename2(), diary.getDiaryId());
		}
		if(diary.getFilename3() != null && !(diary.getFilename3().isEmpty()) && !(diary.getFilename3().equals(defaultname)) ) 
		{
			SQL = "update diary set filename3=? where diaryId=?";
			template.update(SQL, diary.getFilename3(), diary.getDiaryId());
		}
	}

	@Override
	public void deleteDiary(long diaryId) 
	{
		System.out.println("DiaryRepositoryImpl deleteDiary in");
		SQL = "delete from diary where diaryId=?";
		template.update(SQL,diaryId);
	}

	@Override
	public Diary getOnediary(Long diaryId) 
	{
		System.out.println("DiaryRepositoryImpl getOnediary in");
		SQL = "select * from diary where diaryId=?";
		Diary diary = template.queryForObject(SQL, new DiaryRowMapper(), diaryId);
		return diary;
	}
}
