package bean;

public class MessageInfo {
	private Integer message_id;
	private Integer from_id;
	private Integer to_id;
	private Integer type;
	private Integer state;
	public Integer getMessage_id() {
		return message_id;
	}
	public void setMessage_id(Integer message_id) {
		this.message_id = message_id;
	}
	public Integer getFrom_id() {
		return from_id;
	}
	public void setFrom_id(Integer from_id) {
		this.from_id = from_id;
	}
	public Integer getTo_id() {
		return to_id;
	}
	public void setTo_id(Integer to_id) {
		this.to_id = to_id;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	
}
