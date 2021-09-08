CREATE VIEW [dbo].[view_select_objects]
AS

SELECT @@SERVERNAME AS 'Сервер',
       DB_NAME() AS 'База_данных',
	   OBJECT_SCHEMA_NAME(T2.[parent_object_id], DB_ID(DB_NAME())) AS 'Схема_родительского_лбъекта',
	   OBJECT_NAME(T2.[parent_object_id]) AS 'Родительский_объект',
	   SCHEMA_NAME(T2.[schema_id]) AS 'Схема_объекта',
	   T2.[name] AS 'Название_объекта',
	   T6.[value] AS 'Описание_объекта',
	   T2.[type_desc] AS 'Тип_объекта',
	   T2.[create_date] AS 'Дата_создания_объекта',
	   T2.[modify_date] AS 'Дата_изменения_объекта'	
FROM [sys].[objects] AS T2    
     LEFT JOIN 
	 [sys].[extended_properties] AS T6   
	 ON T2.[object_id] = T6.[major_id] AND T6.[minor_id] = 0 
WHERE T2.[type_desc] = 'SQL_TRIGGER'


UNION ALL



SELECT @@SERVERNAME AS 'Сервер',
       DB_NAME() AS 'База_данных',
	   NULL AS 'Схема_родительского_лбъекта',
	   NULL AS 'Родительский_объект',
	   T.[name] AS 'Схема_объекта',
	   T2.[name] AS 'Название_объекта',
	   T6.[value] AS 'Описание_объекта',
	   T2.[type_desc] AS 'Тип_объекта',
	   T2.[create_date] AS 'Дата_создания_объекта',
	   T2.[modify_date] AS 'Дата_изменения_объекта'	
FROM [sys].[objects] AS T2
     LEFT JOIN
     [sys].[schemas] AS T
	 ON T.[schema_id] = T2.[schema_id]
     LEFT JOIN 
	 [sys].[extended_properties] AS T6   
	 ON T2.[object_id] = T6.[major_id] AND T6.[minor_id] = 0 
WHERE T2.[type_desc] = 'SQL_STORED_PROCEDURE'


UNION ALL


SELECT @@SERVERNAME AS 'Сервер',
       DB_NAME() AS 'База_данных',
	   NULL AS 'Схема_родительского_лбъекта',
	   NULL AS 'Родительский_объект',
	   SCHEMA_NAME(T2.[schema_id]) AS 'Схема_объекта',
	   T2.[name] AS 'Название_объекта',
	   T6.[value] AS 'Описание_объекта',
	   T2.[type_desc] AS 'Тип_объекта',
	   T2.[create_date] AS 'Дата_создания_объекта',
	   T2.[modify_date] AS 'Дата_изменения_объекта'	
FROM [sys].[objects] AS T2    
     LEFT JOIN 
	 [sys].[extended_properties] AS T6   
	 ON T2.[object_id] = T6.[major_id] AND T6.[minor_id] = 0 
WHERE T2.[type_desc] LIKE '%FUNCTION%'
 



GO


