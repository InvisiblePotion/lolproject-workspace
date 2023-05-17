package com.base.personlol.dto;

import java.util.Map;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.Getter;
import lombok.experimental.Accessors;

@Data
@Accessors(chain = true)
@Alias("test2dto")
public class test2Dto {
	private int sum;
}
