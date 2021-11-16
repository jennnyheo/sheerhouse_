package com.main.sheerhouse.commons;

import java.io.File;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import com.amazonaws.AmazonServiceException;
import com.amazonaws.SdkClientException;
import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.ClasspathPropertiesFileCredentialsProvider;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.CopyObjectRequest;
import com.amazonaws.services.s3.model.DeleteObjectRequest;
import com.amazonaws.services.s3.model.DeleteObjectsRequest;
import com.amazonaws.services.s3.model.ObjectListing;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.amazonaws.services.s3.model.S3ObjectSummary;

public class AwsS3 {

	private AmazonS3 s3Client;
	private Regions clientRegion = Regions.AP_NORTHEAST_2;
	private String bucket = "sheerhouse2";
	
	private AwsS3() {
		createS3Client();
	}
	
	private static AwsS3 instance = null;
	
	public static AwsS3 getInstance() {
		if(instance == null) {
			return new AwsS3();
		}else {
			return instance;
		}
	}
	
	private void createS3Client() {
		AWSCredentials credentials = new ClasspathPropertiesFileCredentialsProvider("mybatis/config/database.properties").getCredentials();
		this.s3Client = AmazonS3ClientBuilder.standard().withCredentials(
				new AWSStaticCredentialsProvider(credentials)).withRegion(clientRegion).build();
	}
	//���ε� ---------------------------------
	public void upload(File file, String key) {
		uploadToS3(new PutObjectRequest(this.bucket, key, file));
	}
	
	//MultipartFile ���ε�� ���
	public void upload(InputStream is, String key, String contentType, long contentLength) {
		ObjectMetadata objectMetadata = new ObjectMetadata();
		objectMetadata.setContentType(contentType);
		objectMetadata.setContentLength(contentLength);
		
		uploadToS3(new PutObjectRequest(this.bucket, key, is, objectMetadata));
	}
	
	private void uploadToS3(PutObjectRequest putObjectRequest) {
		try {
			this.s3Client.putObject(putObjectRequest);
			System.out.println(String.format("[%s] upload complete", putObjectRequest.getKey()));
		}catch (AmazonServiceException e) {
			e.printStackTrace();
		}catch (SdkClientException e) {
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// ����, ����
	public void copy(String orgKey, String copyKey) {
		try {
			//���� ��ü ����
			CopyObjectRequest copyObjectRequest = new CopyObjectRequest(this.bucket, orgKey, this.bucket, copyKey);
			//����
			this.s3Client.copyObject(copyObjectRequest);
			System.out.println(String.format("Finish copying [%s] to [%s]", orgKey,copyKey));
		}catch (AmazonServiceException e) {
			e.printStackTrace();
		}catch (SdkClientException e) {
			e.printStackTrace();
		}
	}
	
	public void delete(String key) {
		try {
			//���� ��ü ����
			DeleteObjectRequest deleteObjectRequest = new DeleteObjectRequest(this.bucket, key);
			//����
			this.s3Client.deleteObject(deleteObjectRequest);
			System.out.println(String.format("[%s] deletion complete", key));
		}catch (AmazonServiceException e) {
			e.printStackTrace();
		}catch (SdkClientException e) {
			e.printStackTrace();
		}
	
	}
	
	public List<String> getUrl(String key) {
		List<String> list = new ArrayList<String>();
		String rootPath = "https://sheerhouse2.s3.ap-northeast-2.amazonaws.com/";
		ObjectListing objects = s3Client.listObjects("sheerhouse2", key);
		for (S3ObjectSummary os : objects.getObjectSummaries()) {
			list.add(rootPath + os.getKey());
		}
		
		return list;
	}

	public String getUrl(String key, String account) {
		String url="";
		String rootPath = "https://sheerhouse2.s3.ap-northeast-2.amazonaws.com/";
		ObjectListing objects = s3Client.listObjects("sheerhouse2", key);
		for (S3ObjectSummary os : objects.getObjectSummaries()) {
			url = rootPath + os.getKey();
		}
		
		return url;
	}
	
}
