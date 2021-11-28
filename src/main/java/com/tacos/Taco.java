package com.tacos;
import java.util.List;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import lombok.Data;
import java.util.Date;

/**
 * 사용자가 식자재를 선택하여 생성한 타코 디자인에 관한 정보를 저장한다
 */
@Data
public class Taco {
	private Long id;
	private Date createdAt;
	
	@NotNull
	@Size(min=5, message="Name must be at least 5 characters long")
	private String name;
	
	@Size(min=1, message="You must choose at least 1 ingredient")
	private List<Ingredient> ingredients;
}