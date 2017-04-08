package com.binli.agiledev.util;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;


public class JSONUtils
{

	public JSONUtils()
	{
	}
	
	public static void printStr(String jsonStr,HttpServletResponse response)
		throws IOException
	{

		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter pw = response.getWriter();
		pw.print(jsonStr);
		pw.flush();
		pw.close();
	}

	public static void printObject(Object obj,HttpServletResponse response)
		throws IOException
	{
		JSONObject jsObject = JSONObject.fromObject(obj);
		printStr(jsObject.toString(),response);
	}

	public static void printArray(List list,HttpServletResponse response)
		throws IOException
	{
		JSONArray jsArray = JSONArray.fromObject(list);
		printStr(jsArray.toString(),response);
	}

	public static String getString(JSONObject json, String key)
	{
		if (json.has(key))
			return json.getString(key);
		else
			return null;
	}

	public static String toJSONString(List list)
	{
		JSONArray jsonArray = JSONArray.fromObject(list);
		return jsonArray.toString();
	}

	public static String toJSONString(Object object)
	{
		JSONArray jsonArray = JSONArray.fromObject(object);
		return jsonArray.toString();
	}

	public static String toJSONString(JSONArray jsonArray)
	{
		return jsonArray.toString();
	}

	public static String toJSONString(JSONObject jsonObject)
	{
		return jsonObject.toString();
	}

	public static List toArrayList(Object obj)
	{
		throw new Error("Unresolved compilation problem: \n\tUnreachable code\n");
	}

	public static Collection toCollection(Object object)
	{
		JSONArray jsonArray = JSONArray.fromObject(object);
		return JSONArray.toCollection(jsonArray);
	}

	public static JSONArray toJSONArray(Object object)
	{
		return JSONArray.fromObject(object);
	}

	public static JSONObject toJSONObject(Object object)
	{
		return JSONObject.fromObject(object);
	}

	public static HashMap toHashMap(Object object)
	{
		HashMap data = new HashMap();
		JSONObject jsonObject = toJSONObject(object);
		String key;
		Object value;
		for (Iterator it = jsonObject.keys(); it.hasNext(); data.put(key, value))
		{
			key = String.valueOf(it.next());
			value = jsonObject.get(key);
		}

		return data;
	}

	public static List toList(Object object)
	{
		List list = new ArrayList();
		JSONArray jsonArray = JSONArray.fromObject(object);
		Map map;
		for (Iterator iterator = jsonArray.iterator(); iterator.hasNext(); list.add(map))
		{
			Object obj = iterator.next();
			JSONObject jsonObject = (JSONObject)obj;
			map = new HashMap();
			String key;
			Object value;
			for (Iterator it = jsonObject.keys(); it.hasNext(); map.put(key, value))
			{
				key = (String)it.next();
				value = jsonObject.get(key);
			}

		}

		return list;
	}

	public static List toList(JSONArray jsonArray, Class objectClass)
	{
		return JSONArray.toList(jsonArray, objectClass);
	}

	public static List toList(Object object, Class objectClass)
	{
		JSONArray jsonArray = JSONArray.fromObject(object);
		return JSONArray.toList(jsonArray, objectClass);
	}

	public static Object toBean(JSONObject jsonobject, Class class1)
	{
		throw new Error("Unresolved compilation problem: \n\tType mismatch: cannot convert from Object to T\n");
	}

	public static Object toBean(Object obj, Class class1)
	{
		throw new Error("Unresolved compilation problem: \n\tType mismatch: cannot convert from Object to T\n");
	}

	public static Object toBean(String jsonString, Class mainClass, String detailName, Class detailClass)
	{
		JSONObject jsonObject = JSONObject.fromObject(jsonString);
		JSONArray jsonArray = (JSONArray)jsonObject.get(detailName);
		Object mainEntity = toBean(jsonObject, mainClass);
		List detailList = toList(jsonArray, detailClass);
		try
		{
			BeanUtils.setProperty(mainEntity, detailName, detailList);
		}
		catch (Exception ex)
		{
			throw new RuntimeException("主从关系JSON反序列化实体失败！");
		}
		return mainEntity;
	}

	public static Object toBean(String jsonString, Class mainClass, String detailName1, Class detailClass1, String detailName2, Class detailClass2)
	{
		JSONObject jsonObject = JSONObject.fromObject(jsonString);
		JSONArray jsonArray1 = (JSONArray)jsonObject.get(detailName1);
		JSONArray jsonArray2 = (JSONArray)jsonObject.get(detailName2);
		Object mainEntity = toBean(jsonObject, mainClass);
		List detailList1 = toList(jsonArray1, detailClass1);
		List detailList2 = toList(jsonArray2, detailClass2);
		try
		{
			BeanUtils.setProperty(mainEntity, detailName1, detailList1);
			BeanUtils.setProperty(mainEntity, detailName2, detailList2);
		}
		catch (Exception ex)
		{
			throw new RuntimeException("主从关系JSON反序列化实体失败！");
		}
		return mainEntity;
	}

	public static Object toBean(String jsonString, Class mainClass, String detailName1, Class detailClass1, String detailName2, Class detailClass2, String detailName3, Class detailClass3)
	{
		JSONObject jsonObject = JSONObject.fromObject(jsonString);
		JSONArray jsonArray1 = (JSONArray)jsonObject.get(detailName1);
		JSONArray jsonArray2 = (JSONArray)jsonObject.get(detailName2);
		JSONArray jsonArray3 = (JSONArray)jsonObject.get(detailName3);
		Object mainEntity = toBean(jsonObject, mainClass);
		List detailList1 = toList(jsonArray1, detailClass1);
		List detailList2 = toList(jsonArray2, detailClass2);
		List detailList3 = toList(jsonArray3, detailClass3);
		try
		{
			BeanUtils.setProperty(mainEntity, detailName1, detailList1);
			BeanUtils.setProperty(mainEntity, detailName2, detailList2);
			BeanUtils.setProperty(mainEntity, detailName3, detailList3);
		}
		catch (Exception ex)
		{
			throw new RuntimeException("主从关系JSON反序列化实体失败！");
		}
		return mainEntity;
	}

	public static Object toBean(String jsonString, Class mainClass, HashMap detailClass)
	{
		JSONObject jsonObject = JSONObject.fromObject(jsonString);
		Object mainEntity = toBean(jsonObject, mainClass);
		for (Iterator iterator = detailClass.keySet().iterator(); iterator.hasNext();)
		{
			Object key = iterator.next();
			try
			{
				Class value = (Class)detailClass.get(key);
				BeanUtils.setProperty(mainEntity, key.toString(), value);
			}
			catch (Exception ex)
			{
				throw new RuntimeException("主从关系JSON反序列化实体失败！");
			}
		}

		return mainEntity;
	}
}
