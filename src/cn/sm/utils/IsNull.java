package cn.sm.utils;

import java.lang.reflect.Field;

public class IsNull {

	public boolean isNull(Object obj) {
		
		boolean flag = false;
		for(Field filed : obj.getClass().getDeclaredFields()) {
			filed.setAccessible(true);
			try {
				if("".equals(filed.get(obj)) || filed.get(obj) == null) {
					flag = false;
					System.out.println(filed.getName()+":类属性有空或者空字符串");
					break;
				}else {
					System.out.println(filed.getName()+"属性是："+filed.get(obj));
					flag = true;
				}
			} catch (IllegalArgumentException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return flag;
	}
}
