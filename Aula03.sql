SET SERVEROUTPUT ON;
DECLARE
valor NUMBER := &digiteUmValor;
entrada NUMBER := valor*0.20;
parcelas NUMBER := &parcelas;



BEGIN
    

dbms_output.put_line('O valor total do carro: R$' || valor);
dbms_output.put_line('O valor total do carro: R$' || entrada);
dbms_output.put_line('O valor total do carro: R$' || parcelas || 
'Vezes: ' || 'R$: ' ||((valor - entrada)/10) *1.10 );
dbms_output.put_line('Valor total do carro financiado � R$ ' ||
((((valor - entrada)) * 1.10) + entrada ));
END;


declare

genero VARCHAR2(20) := '&DigiteUmvalor';


 

begin
if upper(genero) = 'M' Then
    dbms_output.put_line('O genero informado � masculino');
    elsif upper (genero) = 'F' then
    dbms_output.put_line('O genero informado � Feminino');
    Else
        dbms_output.put_line ('Valor digitado inv�lido');
     End if;
        
end;
 


declare
   numero NUMBER := &digiteUmValor;


begin
 if mod( numero,2)=0 then
 dbms_output.put_line('O valor digitado '|| 
   numero||
 ' � par');
 
 else
    dbms_output.put_line(
    'O valor digitado ' 
    || numero || 
    ' � impar ');
 end if;
 
end;

SELECT * FROM Tabeladevendas
