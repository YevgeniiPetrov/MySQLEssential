/* ������� 5
�� ������� 3 ��������� �� id 1 ��� �� �����, ������� �������� ������ � ������� ������� � �������� ���������.*/

use mydb;

update 
	employee_personal_data
set 
	married = true
where 
	id = 1;
	