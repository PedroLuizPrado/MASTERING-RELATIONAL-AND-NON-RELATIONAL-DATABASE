set SERVEROUTPUT on;

declare

 v_number1 number :=1.412;
 v_number2 number :=0.25;
 
 v_number3 number :=0.353;

--v_nome varchar2(30);
--v_idade number :=19;

begin
 
 dbms_output.put_line('O valor do novo salário é: ' || v_number1 * v_number2);
dbms_output.put_line(v_number1 + v_number3);

--v_nome := 'Pedro';

--dbms_output.put_line(' Nome: ' || v_nome || ' idade: ' || v_idade);


end;