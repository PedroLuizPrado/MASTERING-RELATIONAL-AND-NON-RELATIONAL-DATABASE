@ 'C:\Users\labsfiap\Desktop\MASTERING-RELATIONAL-AND-NON-RELATIONAL-DATABASE\script_modelo_pedido.SQL';

INSERT INTO PAIS SELECT * FROM PF1788.PAIS;
INSERT INTO ESTADO SELECT * FROM PF1788.ESTADO;
INSERT INTO CIDADE SELECT * FROM PF1788.CIDADE;
INSERT INTO TIPO_ENDERECO SELECT * FROM PF1788.TIPO_ENDERECO;
INSERT INTO CLIENTE SELECT * FROM PF1788.CLIENTE;
INSERT INTO ENDERECO_CLIENTE SELECT * FROM PF1788.ENDERECO_CLIENTE;
INSERT INTO USUARIO SELECT * FROM PF1788.USUARIO;
INSERT INTO VENDEDOR SELECT * FROM PF1788.VENDEDOR;
INSERT INTO PRODUTO SELECT * FROM PF1788.PRODUTO;
INSERT INTO PRODUTO_COMPOSTO SELECT * FROM PF1788.PRODUTO_COMPOSTO;
INSERT INTO TIPO_MOVIMENTO_ESTOQUE SELECT * FROM PF1788.TIPO_MOVIMENTO_ESTOQUE;
INSERT INTO ESTOQUE SELECT * FROM PF1788.ESTOQUE;
INSERT INTO ESTOQUE_PRODUTO SELECT * FROM PF1788.ESTOQUE_PRODUTO;
INSERT INTO MOVIMENTO_ESTOQUE SELECT * FROM PF1788.MOVIMENTO_ESTOQUE;
INSERT INTO CLIENTE_VENDEDOR SELECT * FROM PF1788.CLIENTE_VENDEDOR;
INSERT INTO PEDIDO SELECT * FROM PF1788.PEDIDO;
INSERT INTO HISTORICO_PEDIDO SELECT * FROM PF1788.HISTORICO_PEDIDO;
INSERT INTO ITEM_PEDIDO SELECT * FROM PF1788.ITEM_PEDIDO;

SELECT * FROM PF1788.PAIS;
SELECT * FROM PF1788.ESTADO;
SELECT * FROM PF1788.CIDADE;
SELECT * FROM PF1788.TIPO_ENDERECO;
SELECT * FROM PF1788.CLIENTE;
SELECT * FROM PF1788.ENDERECO_CLIENTE;
SELECT * FROM PF1788.USUARIO;
SELECT * FROM PF1788.VENDEDOR;
SELECT * FROM PF1788.PRODUTO;
SELECT * FROM PF1788.PRODUTO_COMPOSTO;
SELECT * FROM PF1788.TIPO_MOVIMENTO_ESTOQUE;
SELECT * FROM PF1788.ESTOQUE;
SELECT * FROM PF1788.ESTOQUE_PRODUTO;
SELECT * FROM PF1788.MOVIMENTO_ESTOQUE;
SELECT * FROM PF1788.CLIENTE_VENDEDOR;
SELECT * FROM PF1788.PEDIDO;
SELECT * FROM PF1788.HISTORICO_PEDIDO;
SELECT * FROM PF1788.ITEM_PEDIDO;



set SERVEROUTPUT on;

BEGIN 
    FOR x IN (
    SELECT
        a.cod_produto,
        b.nom_produto,
        SUM(qtd_movimentacao_estoque) qtd
    FROM
        movimento_estoque a
        INNER JOIN produto b ON a.cod_produto = b.cod_produto
    WHERE 
    a.cod_produto = &produto
    GROUP BY
        a.cod_produto,
        b.nom_produto
    ) LOOP
        dbms_output.put_line('O Produto de C�digo '
        || x.cod_produto || 'Com Descri��o ' || x.nom_produto 
        || 'Tem o Total de: ' 
        || x.qtd || 'Produtos no Estoque');
        
        END LOOP;
    END;




set SERVEROUTPUT on;
BEGIN 
 FOR i In (
 SELECT 
    hp.cod_cliente,
    cli.nom_cliente,
    round(AVG(hp.val_total_pedido),
    2) media
FROM
        historico_pedido hp
        INNER JOIN cliente cli ON  hp.cod_cliente = cli.cod_cliente
        WHERE 
        hp.cod_cliente = &cliente
        GROUP BY 
        hp.cod_cliente,
        cli.nom_cliente
  ) LOOP
    dbms_output.put_line('O CLIENTE DE NOME '
                        || i.nom_cliente ||
                        'TEVE A M�DIA DE ' ||
                        i.media || 'DE COMPRAS');
  END LOOP;
  END;
