package OperationTheater;

import java.sql.ResultSet;

import database.dbcon;

public class OperationRegistrationBean {
	private int id, total_cost, paid_cost, patient_id;

	public int getPatient_id() {
		return patient_id;
	}

	public void setPatient_id(int patient_id) {
		this.patient_id = patient_id;
	}

	private String op_type, op_name, op_date, op_time, surgeon_name,
			asurgeon_name, nurse_name, ot_boy_name, op_theater, p_name,blood_group,p_address,p_age,p_gender;

	public String getBlood_group() {
		return blood_group;
	}

	public void setBlood_group(String blood_group) {
		this.blood_group = blood_group;
	}

	public String getP_address() {
		return p_address;
	}

	public void setP_address(String p_address) {
		this.p_address = p_address;
	}

	public String getP_age() {
		return p_age;
	}

	public void setP_age(String p_age) {
		this.p_age = p_age;
	}

	public String getP_gender() {
		return p_gender;
	}

	public void setP_gender(String p_gender) {
		this.p_gender = p_gender;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public String getOp_theater() {
		return op_theater;
	}

	public void setOp_theater(String op_theater) {
		this.op_theater = op_theater;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getTotal_cost() {
		return total_cost;
	}

	public void setTotal_cost(int total_cost) {
		this.total_cost = total_cost;
	}

	public int getPaid_cost() {
		return paid_cost;
	}

	public void setPaid_cost(int paid_cost) {
		this.paid_cost = paid_cost;
	}

	public String getOp_type() {
		return op_type;
	}

	public void setOp_type(String op_type) {
		this.op_type = op_type;
	}

	public String getOp_name() {
		return op_name;
	}

	public void setOp_name(String op_name) {
		this.op_name = op_name;
	}

	public String getOp_date() {
		return op_date;
	}

	public void setOp_date(String op_date) {
		this.op_date = op_date;
	}

	public String getOp_time() {
		return op_time;
	}

	public void setOp_time(String op_time) {
		this.op_time = op_time;
	}

	public String getSurgeon_name() {
		return surgeon_name;
	}

	public void setSurgeon_name(String surgeon_name) {
		this.surgeon_name = surgeon_name;
	}

	public String getAsurgeon_name() {
		return asurgeon_name;
	}

	public void setAsurgeon_name(String asurgeon_name) {
		this.asurgeon_name = asurgeon_name;
	}

	public String getNurse_name() {
		return nurse_name;
	}

	public void setNurse_name(String nurse_name) {
		this.nurse_name = nurse_name;
	}

	public String getOt_boy_name() {
		return ot_boy_name;
	}

	public void setOt_boy_name(String ot_boy_name) {
		this.ot_boy_name = ot_boy_name;
	}

	public OperationRegistrationBean() {
		// TODO Auto-generated constructor stub
	}

	public OperationRegistrationBean(int o_id) {

		String sql = "select * from operation_patient,patient  where patient.patient_registrationno=operation_patient.patient_id and operation_id="
				+ o_id;
		dbcon db = dbcon.getConnection();
		ResultSet rs = db.select(sql);
		try{
		while(rs.next()){
			/*operation_idint(11) NOT NULL
			operation_datevarchar(30) NULL
			operation_timevarchar(10) NULL
			operation_typevarchar(10) NULL
			operation_namevarchar(100) NULL
			patient_idint(11) NULL
			operation_costint(11) NULL
			paid_operation_costint(11) NULL
			surgeon_namevarchar(50) NULL
			assistant_surgeon_namevarchar(50) NULL
			nurse_Namevarchar(50) NULL
			ot_boy_namevarchar(100) NULL
			operation_theatervarchar(30) NULL*/
			this.total_cost =rs.getInt("operation_cost");
			this.paid_cost = rs.getInt("paid_operation_cost");
			this.patient_id = rs.getInt("patient_id");
			this.op_type = rs.getString("operation_type");
			this.op_name = rs.getString("operation_name");
			this.op_date = rs.getString("operation_date");
			this.op_time = rs.getString("operation_time");
			this.surgeon_name = rs.getString("surgeon_name");
			this.asurgeon_name = rs.getString("assistant_surgeon_name");
			this.nurse_name = rs.getString("nurse_Name");
			this.ot_boy_name = rs.getString("ot_boy_name");
				this.op_theater = rs.getString("operation_theater");
				p_name = rs.getString("patient_name");
				blood_group=rs.getString("patient_bloodgroup");
				p_address=rs.getString("patient_address");
				p_age=rs.getString("patient_age");
				p_gender=rs.getString("patient_gender");

			}
		}catch (Exception e) {
			// TODO: handle exception
		}

	}

	public OperationRegistrationBean(int id, int total_cost, int paid_cost,
			int patient_id, String op_type, String op_name, String op_date,
			String op_time, String surgeon_name, String asurgeon_name,
			String nurse_name, String ot_boy_name, String op_theater,
			String p_names) {
		super();
		this.id = id;
		this.total_cost = total_cost;
		this.paid_cost = paid_cost;
		this.patient_id = patient_id;
		this.op_type = op_type;
		this.op_name = op_name;
		this.op_date = op_date;
		this.op_time = op_time;
		this.surgeon_name = surgeon_name;
		this.asurgeon_name = asurgeon_name;
		this.nurse_name = nurse_name;
		this.ot_boy_name = ot_boy_name;
		this.op_theater = op_theater;
		p_name = p_names;
	}

}
