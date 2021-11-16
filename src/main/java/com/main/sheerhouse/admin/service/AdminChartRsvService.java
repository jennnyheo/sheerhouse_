package com.main.sheerhouse.admin.service;

import java.util.List;

public interface AdminChartRsvService {

	int cntRsvAll();
	
	int cntRsvSuccess();
	
	int cntRsvFailed();
	
	int cntRsvStay();
	
	List<Double> result();

	
	
}
