
unit UEtiquetas;

interface

uses SysUtils, Dialogs;

  Type
    TEtiquetas = Class
    Private
      FNum_Linhas : Integer;
      fNumCopias : Integer;
      fNumCopias2 : Integer;
      procedure EtiquetasPequenas(Preco:Integer; nEtiquetasImp, nEtiquetas:Integer);
      procedure Etiquetas;
      procedure ImprimeEtiquetas(Posicoes: Array of Integer; ComPreco: Boolean);
      function VerificaVetor(Vetor: Array of Integer; Valor: Integer): Boolean;
    Public
      Procedure EmiteEtiquetas(Tipo_Relatorio,Preco:Integer; nEtiquetasImp:Integer=0; nEtiquetas:Integer=0);
      Property PNum_Linhas:Integer read FNum_Linhas write FNum_Linhas;
      Property pNumCopias : Integer read fNumCopias write fNumCopias;
      Property pNumCopias2 : Integer read fNumCopias2 write fNumCopias2;
  End;

Var
  Etiquetas : TEtiquetas;

implementation

uses UBiblioteca, UProduto_cl, UCadastro_cl,UParamSistema_cl,UCadastro_Rel_cl,UProdutoRelatorio_Cl;
{ TEtiquetas }

procedure TEtiquetas.EmiteEtiquetas(Tipo_Relatorio,Preco: Integer; nEtiquetasImp:Integer=0; nEtiquetas:Integer=0);
begin
  if imp = Nil then
    imp:=TImp.Create;
  Imp.AbreImpressora;
  Case Tipo_Relatorio Of
    1: Begin
       Imp.ConfiguraImpressora('CONDENSADO_ON','SEXTOS',4);
       EtiquetasPequenas(Preco, nEtiquetasImp, nEtiquetas);
       End;
    2: Begin
       Imp.ConfiguraImpressora('CONDENSADO_OFF','SEXTOS',7);
       Etiquetas;
       End;
    3: Begin
       Imp.ConfiguraImpressora('CONDENSADO_ON','OITAVOS',7);
       Etiquetas;
       End;
  end;
  Imp.ConfiguraImpressora('CONDENSADO_OFF','SEXTOS',66);
  Imp.FechaImpressora;  // Finaliza os serviços de Impressao
end;

procedure TEtiquetas.Etiquetas;
var
  I,j,wMargem1,wMargem2,wMargem3:integer;
begin
  if DMParamSistema.QParamSistemaCod_Empresa.text = 'ZADIMEL' then
  begin
    wMargem1:=10;
    wMargem2:=16;
    wMargem3:=14;
  end
  else
  begin
//    if DMParamSistema.QParamSistemaCod_Empresa.text = 'RADIO' then
//    begin
 //     wMargem1:=11;
 //     wMargem2:=17;
//      wMargem3:=15;
//    end;
    wMargem1:=11;
    wMargem2:=17;
    wMargem3:=15;
  end;

  with DMCadastro_Rel do
  begin
      if (pNumCopias = 1) and (pNumCopias2 = 1) then
      begin
         Imp.WriteXY(1,0,Copy(QREtiquetasNome.text,1,40));
         Imp.WriteXY(wMargem1,0,Copy(QREtiquetas2Nome.text,1,34));
         Imp.WriteXY(1,1,Copy(QREtiquetasDesc_Endereco.text,1,40));
         Imp.WriteXY(wMargem1,1,Copy(QREtiquetas2Desc_Endereco.text,1,34));
         Imp.WriteXY(1,2,Copy(QREtiquetasDesc_Cidade.text,1,34));
         Imp.WriteXY(7.5,2,QREtiquetasCod_Estado.value);
         Imp.WriteXY(wMargem1,2,Copy(QREtiquetas2Desc_Cidade.text,1,34));
         Imp.WriteXY(wMargem2,2,QREtiquetas2Cod_Estado.value);
         Imp.WriteXY(1,3,'CX '+Copy(QREtiquetasNum_caixa_postal.text,1,40));
         Imp.WriteXY(wMargem1,3,'CX '+Copy(QREtiquetas2Num_caixa_postal.text,1,34));
         Imp.WriteXY(1,4,'CEP:'+QREtiquetasDesc_cep.value);
         Imp.WriteXY(6.2,4,QREtiquetasDesc_telefone.Value);
         Imp.WriteXY(wMargem1,4,'CEP:'+QREtiquetas2Desc_cep.Value);
         Imp.WriteXY(wMargem3,4,QREtiquetas2Desc_telefone.Value);
         Imp.WriteXY(1,5,QREtiquetasDesc_bairro.Value);
         Imp.WriteXY(wMargem1,5,QREtiquetas2Desc_bairro.Value);
         Imp.SaltaPaginaEtiquetas2;
      end
      else
      begin
        if (pNumCopias >= 1) then
        begin
          if ((pNumCopias mod 2) <> 0) then
          begin
            for i:=1 to (pNumCopias div 2) do
            begin
              Imp.WriteXY(1,0,Copy(QREtiquetasNome.text,1,40));
              Imp.WriteXY(wMargem1,0,Copy(QREtiquetas2Nome.text,1,34));
              Imp.WriteXY(1,1,Copy(QREtiquetasDesc_Endereco.text,1,40));
              Imp.WriteXY(wMargem1,1,Copy(QREtiquetas2Desc_Endereco.text,1,34));
              Imp.WriteXY(1,2,Copy(QREtiquetasDesc_Cidade.text,1,34));
              Imp.WriteXY(7.5,2,QREtiquetasCod_Estado.value);
              Imp.WriteXY(wMargem1,2,Copy(QREtiquetas2Desc_Cidade.text,1,34));
              Imp.WriteXY(wMargem2,2,QREtiquetas2Cod_Estado.value);
              Imp.WriteXY(1,3,'CX '+Copy(QREtiquetasNum_caixa_postal.text,1,40));
              Imp.WriteXY(wMargem1,3,'CX '+Copy(QREtiquetas2Num_caixa_postal.text,1,34));
              Imp.WriteXY(1,4,'CEP:'+QREtiquetasDesc_cep.value);
              Imp.WriteXY(6.2,4,QREtiquetasDesc_telefone.Value);
              Imp.WriteXY(wMargem1,4,'CEP:'+QREtiquetas2Desc_cep.Value);
              Imp.WriteXY(wMargem3,4,QREtiquetas2Desc_telefone.Value);
              Imp.WriteXY(1,5,QREtiquetasDesc_bairro.Value);
              Imp.WriteXY(wMargem1,5,QREtiquetas2Desc_bairro.Value);
              Imp.SaltaPaginaEtiquetas2;
            end;
            if (pNumCopias2 >= 1) then
            begin
              Imp.WriteXY(1,0,Copy(QREtiquetasNome.text,1,40));
              Imp.WriteXY(wMargem1,0,Copy(QREtiquetas2Nome.text,1,34));
              Imp.WriteXY(1,1,Copy(QREtiquetasDesc_Endereco.text,1,40));
              Imp.WriteXY(wMargem1,1,Copy(QREtiquetas2Desc_Endereco.text,1,34));
              Imp.WriteXY(1,2,Copy(QREtiquetasDesc_Cidade.text,1,34));
              Imp.WriteXY(7.5,2,QREtiquetasCod_Estado.value);
              Imp.WriteXY(wMargem1,2,Copy(QREtiquetas2Desc_Cidade.text,1,34));
              Imp.WriteXY(wMargem2,2,QREtiquetas2Cod_Estado.value);
              Imp.WriteXY(1,3,'CX '+Copy(QREtiquetasNum_caixa_postal.text,1,40));
              Imp.WriteXY(wMargem1,3,'CX '+Copy(QREtiquetas2Num_caixa_postal.text,1,34));
              Imp.WriteXY(1,4,'CEP:'+QREtiquetasDesc_cep.value);
              Imp.WriteXY(6.2,4,QREtiquetasDesc_telefone.Value);
              Imp.WriteXY(wMargem1,4,'CEP:'+QREtiquetas2Desc_cep.Value);
              Imp.WriteXY(wMargem3,4,QREtiquetas2Desc_telefone.Value);
              Imp.WriteXY(1,5,QREtiquetasDesc_bairro.Value);
              Imp.WriteXY(wMargem1,5,QREtiquetas2Desc_bairro.Value);
              pNumCopias2:=pNumCopias2-1;
              Imp.SaltaPaginaEtiquetas2;
            end
            else
            begin
              //---imprime apenas a etiqueta esquerda quando nao houver uma etiqueta direita de um segundo cliente
//              Imp.WriteXY(1,0,'CODIGO : '+QREtiquetasCod_Cadastro.text);
              Imp.WriteXY(1,0,Copy(QREtiquetasNome.text,1,40));
              Imp.WriteXY(1,1,QREtiquetasDesc_Endereco.text);
              Imp.WriteXY(1,2,QREtiquetasDesc_Cidade.text);
              Imp.WriteXY(7.5,2,QREtiquetasCod_Estado.value);
              Imp.WriteXY(1,3,'CX '+QREtiquetasNum_caixa_postal.text);
              Imp.WriteXY(1,4,'CEP:'+QREtiquetasDesc_cep.value);
              Imp.WriteXY(6.2,4,QREtiquetasDesc_telefone.Value);
              Imp.WriteXY(1,5,QREtiquetasDesc_bairro.Value);
              Imp.SaltaPaginaEtiquetas2;
            end;
          end
          else
          begin
            for i:=1 to (pNumCopias div 2) do
            begin
              Imp.WriteXY(1,0,Copy(QREtiquetasNome.text,1,40));
              Imp.WriteXY(wMargem1,0,Copy(QREtiquetas2Nome.text,1,34));
              Imp.WriteXY(1,1,Copy(QREtiquetasDesc_Endereco.text,1,40));
              Imp.WriteXY(wMargem1,1,Copy(QREtiquetas2Desc_Endereco.text,1,34));
              Imp.WriteXY(1,2,Copy(QREtiquetasDesc_Cidade.text,1,34));
              Imp.WriteXY(7.5,2,QREtiquetasCod_Estado.value);
              Imp.WriteXY(wMargem1,2,Copy(QREtiquetas2Desc_Cidade.text,1,34));
              Imp.WriteXY(wMargem2,2,QREtiquetas2Cod_Estado.value);
              Imp.WriteXY(1,3,'CX '+Copy(QREtiquetasNum_caixa_postal.text,1,40));
              Imp.WriteXY(wMargem1,3,'CX '+Copy(QREtiquetas2Num_caixa_postal.text,1,34));
              Imp.WriteXY(1,4,'CEP:'+QREtiquetasDesc_cep.value);
              Imp.WriteXY(6.2,4,QREtiquetasDesc_telefone.Value);
              Imp.WriteXY(wMargem1,4,'CEP:'+QREtiquetas2Desc_cep.Value);
              Imp.WriteXY(wMargem3,4,QREtiquetas2Desc_telefone.Value);
              Imp.WriteXY(1,5,QREtiquetasDesc_bairro.Value);
              Imp.WriteXY(wMargem1,5,QREtiquetas2Desc_bairro.Value);
              Imp.SaltaPaginaEtiquetas2;
            end;
          end;
        end;

        //--impressao segundo cliente
        if (pNumCopias2 >= 1) then
        begin
          if ((pNumCopias2 mod 2) <> 0) then
          begin
            for i:=1 to (pNumCopias2 div 2) do
            begin
              Imp.WriteXY(1,0,Copy(QREtiquetasNome.text,1,40));
              Imp.WriteXY(wMargem1,0,Copy(QREtiquetas2Nome.text,1,34));
              Imp.WriteXY(1,1,Copy(QREtiquetasDesc_Endereco.text,1,40));
              Imp.WriteXY(wMargem1,1,Copy(QREtiquetas2Desc_Endereco.text,1,34));
              Imp.WriteXY(1,2,Copy(QREtiquetasDesc_Cidade.text,1,34));
              Imp.WriteXY(7.5,2,QREtiquetasCod_Estado.value);
              Imp.WriteXY(wMargem1,2,Copy(QREtiquetas2Desc_Cidade.text,1,34));
              Imp.WriteXY(wMargem2,2,QREtiquetas2Cod_Estado.value);
              Imp.WriteXY(1,3,'CX '+Copy(QREtiquetasNum_caixa_postal.text,1,40));
              Imp.WriteXY(wMargem1,3,'CX '+Copy(QREtiquetas2Num_caixa_postal.text,1,34));
              Imp.WriteXY(1,4,'CEP:'+QREtiquetasDesc_cep.value);
              Imp.WriteXY(6.2,4,QREtiquetasDesc_telefone.Value);
              Imp.WriteXY(wMargem1,4,'CEP:'+QREtiquetas2Desc_cep.Value);
              Imp.WriteXY(wMargem3,4,QREtiquetas2Desc_telefone.Value);
              Imp.WriteXY(1,5,QREtiquetasDesc_bairro.Value);
              Imp.WriteXY(wMargem1,5,QREtiquetas2Desc_bairro.Value);
              Imp.SaltaPaginaEtiquetas2;
            end;
            //---imprime apenas a etiqueta esquerda caso sobrar um segundo cliente
            //no caso de o numero de etiquetas do cliente1 ter sido impar e numero de etiquetas do
            //segundo cliente seja par
            Imp.WriteXY(1,0,Copy(QREtiquetasNome.text,1,40));
            Imp.WriteXY(1,1,QREtiquetasDesc_Endereco.text);
            Imp.WriteXY(1,2,QREtiquetasDesc_Cidade.text);
            Imp.WriteXY(7.5,2,QREtiquetasCod_Estado.value);
            Imp.WriteXY(1,3,'CX '+QREtiquetasNum_caixa_postal.text);
            Imp.WriteXY(1,4,'CEP:'+QREtiquetas2Desc_cep.value);
            Imp.WriteXY(6.2,4,QREtiquetasDesc_telefone.Value);
            Imp.WriteXY(1,5,QREtiquetas2Desc_bairro.Value);
            Imp.SaltaPaginaEtiquetas2;
          end
          else
          begin
            for i:=1 to (pNumCopias2 div 2) do
            begin
              Imp.WriteXY(1,0,Copy(QREtiquetasNome.text,1,40));
              Imp.WriteXY(wMargem1,0,Copy(QREtiquetas2Nome.text,1,34));
              Imp.WriteXY(1,1,Copy(QREtiquetasDesc_Endereco.text,1,40));
              Imp.WriteXY(wMargem1,1,Copy(QREtiquetas2Desc_Endereco.text,1,34));
              Imp.WriteXY(1,2,Copy(QREtiquetasDesc_Cidade.text,1,34));
              Imp.WriteXY(7.5,2,QREtiquetasCod_Estado.value);
              Imp.WriteXY(wMargem1,2,Copy(QREtiquetas2Desc_Cidade.text,1,34));
              Imp.WriteXY(wMargem2,2,QREtiquetas2Cod_Estado.value);
              Imp.WriteXY(1,3,'CX '+Copy(QREtiquetasNum_caixa_postal.text,1,40));
              Imp.WriteXY(wMargem1,3,'CX '+Copy(QREtiquetas2Num_caixa_postal.text,1,34));
              Imp.WriteXY(1,4,'CEP:'+QREtiquetasDesc_cep.value);
              Imp.WriteXY(6.2,4,QREtiquetasDesc_telefone.Value);
              Imp.WriteXY(wMargem1,4,'CEP:'+QREtiquetas2Desc_cep.Value);
              Imp.WriteXY(wMargem3,4,QREtiquetas2Desc_telefone.Value);
              Imp.WriteXY(1,5,QREtiquetasDesc_bairro.Value);
              Imp.WriteXY(wMargem1,5,QREtiquetas2Desc_bairro.Value);
              Imp.SaltaPaginaEtiquetas2;
            end;
          end;
        end;
      end;
  end;
end;

function TEtiquetas.VerificaVetor(Vetor: Array of Integer; Valor: Integer): Boolean;
var i: Integer;
begin
  i := 0;
  while i < Length(Vetor) do
  begin
    if Vetor[i] = Valor then
      Break;
    Inc(i);
  end;

  if i = Length(Vetor) then
    VerificaVetor := False
  else
    VerificaVetor := True;
end;

procedure TEtiquetas.ImprimeEtiquetas(Posicoes: Array of Integer; ComPreco: Boolean);
begin
  with DMProdutoRelatorio do
  begin
    if DMParamSistema.QParamSistemaCod_Empresa.Text = 'CHAIANA' then
    begin
      //primeira linha
      if VerificaVetor(Posicoes, 1) then
        Imp.WriteXY(0,0,Copy(QRProdutoEtiquetasDesc_Produto.Value,1,16));
      if VerificaVetor(Posicoes, 2) then
        Imp.WriteXY(2.9,0,Copy(QRProdutoEtiquetasDesc_Produto.Value,1,16));
      if VerificaVetor(Posicoes, 3) then
        Imp.WriteXY(6,0,Copy(QRProdutoEtiquetasDesc_Produto.Value,1,16));
      if VerificaVetor(Posicoes, 4) then
        Imp.WriteXY(9,0,Copy(QRProdutoEtiquetasDesc_Produto.Value,1,16));
      if VerificaVetor(Posicoes, 5) then
        Imp.WriteXY(12,0,Copy(QRProdutoEtiquetasDesc_Produto.Value,1,16));
      //fim da primeira linha

      //segunda linha
      if VerificaVetor(Posicoes, 1) then
        Imp.WriteXY(0,1,Copy(QRProdutoEtiquetasDesc_Produto.Value,17,16));
      if VerificaVetor(Posicoes, 2) then
        Imp.WriteXY(2.9,1,Copy(QRProdutoEtiquetasDesc_Produto.Value,17,16));
      if VerificaVetor(Posicoes, 3) then
        Imp.WriteXY(6,1,Copy(QRProdutoEtiquetasDesc_Produto.Value,17,16));
      if VerificaVetor(Posicoes, 4) then
        Imp.WriteXY(9,1,Copy(QRProdutoEtiquetasDesc_Produto.Value,17,16));
      if VerificaVetor(Posicoes, 5) then
        Imp.WriteXY(12,1,Copy(QRProdutoEtiquetasDesc_Produto.Value,17,16));
      //fim da segunda linha

      //terceira linha (com preço de venda)
      if ComPreco then
      begin
        if VerificaVetor(Posicoes, 1) then
          Imp.WriteXY(0,2,FloatToStr(QRProdutoEtiquetasCod_Produto.Value)+' '+FormatFloat('R$ #,##0.00',QRProdutoEtiquetasVal_Varejo.Value));
        if VerificaVetor(Posicoes, 2) then
          Imp.WriteXY(2.9,2,FloatToStr(QRProdutoEtiquetasCod_Produto.Value)+' '+FormatFloat('R$ #,##0.00',QRProdutoEtiquetasVal_Varejo.Value));
        if VerificaVetor(Posicoes, 3) then
          Imp.WriteXY(6,2,FloatToStr(QRProdutoEtiquetasCod_Produto.Value)+' '+FormatFloat('R$ #,##0.00',QRProdutoEtiquetasVal_Varejo.Value));
        if VerificaVetor(Posicoes, 4) then
          Imp.WriteXY(9,2,FloatToStr(QRProdutoEtiquetasCod_Produto.Value)+' '+FormatFloat('R$ #,##0.00',QRProdutoEtiquetasVal_Varejo.Value));
        if VerificaVetor(Posicoes, 5) then
          Imp.WriteXY(12,2,FloatToStr(QRProdutoEtiquetasCod_Produto.Value)+' '+FormatFloat('R$ #,##0.00',QRProdutoEtiquetasVal_Varejo.Value));
      end
      //fim da terceira linha
      else
      //terceira linha (sem preço de venda)
      begin
        if VerificaVetor(Posicoes, 1) then
          Imp.WriteXY(0,2,FloatToStr(QRProdutoEtiquetasCod_Produto.Value));
        if VerificaVetor(Posicoes, 2) then
          Imp.WriteXY(2.9,2,FloatToStr(QRProdutoEtiquetasCod_Produto.Value));
        if VerificaVetor(Posicoes, 3) then
          Imp.WriteXY(6,2,FloatToStr(QRProdutoEtiquetasCod_Produto.Value));
        if VerificaVetor(Posicoes, 4) then
          Imp.WriteXY(9,2,FloatToStr(QRProdutoEtiquetasCod_Produto.Value));
        if VerificaVetor(Posicoes, 5) then
          Imp.WriteXY(12,2,FloatToStr(QRProdutoEtiquetasCod_Produto.Value));
      end;
      //fim da terceira linha
    end
    else
    begin //para outros
      //primeira linha
      if VerificaVetor(Posicoes, 1) then
        Imp.WriteXY(0.3,1,Copy(QRProdutoEtiquetasDesc_Produto.Value,1,16));
      if VerificaVetor(Posicoes, 2) then
        Imp.WriteXY(3.2,1,Copy(QRProdutoEtiquetasDesc_Produto.Value,1,16));
      if VerificaVetor(Posicoes, 3) then
        Imp.WriteXY(6.3,1,Copy(QRProdutoEtiquetasDesc_Produto.Value,1,16));
      if VerificaVetor(Posicoes, 4) then
        Imp.WriteXY(9.3,1,Copy(QRProdutoEtiquetasDesc_Produto.Value,1,16));
      if VerificaVetor(Posicoes, 5) then
        Imp.WriteXY(12.3,1,Copy(QRProdutoEtiquetasDesc_Produto.Value,1,16));
      //fim da primeira linha

      //segunda linha
      if VerificaVetor(Posicoes, 1) then
        Imp.WriteXY(0.3,2,Copy(QRProdutoEtiquetasDesc_Produto.Value,17,16));
      if VerificaVetor(Posicoes, 2) then
        Imp.WriteXY(3.2,2,Copy(QRProdutoEtiquetasDesc_Produto.Value,17,16));
      if VerificaVetor(Posicoes, 3) then
        Imp.WriteXY(6.3,2,Copy(QRProdutoEtiquetasDesc_Produto.Value,17,16));
      if VerificaVetor(Posicoes, 4) then
        Imp.WriteXY(9.3,2,Copy(QRProdutoEtiquetasDesc_Produto.Value,17,16));
      if VerificaVetor(Posicoes, 5) then
        Imp.WriteXY(12.3,2,Copy(QRProdutoEtiquetasDesc_Produto.Value,17,16));
      //fim da segunda linha

      //terceira linha (com preço de venda)
      if ComPreco then
      begin
        if VerificaVetor(Posicoes, 1) then
          Imp.WriteXY(0.3,3,FloatToStr(QRProdutoEtiquetasCod_Produto.Value)+' '+FormatFloat('R$ #,##0.00',QRProdutoEtiquetasVal_Varejo.Value));
        if VerificaVetor(Posicoes, 2) then
          Imp.WriteXY(3.2,3,FloatToStr(QRProdutoEtiquetasCod_Produto.Value)+' '+FormatFloat('R$ #,##0.00',QRProdutoEtiquetasVal_Varejo.Value));
        if VerificaVetor(Posicoes, 3) then
          Imp.WriteXY(6.3,3,FloatToStr(QRProdutoEtiquetasCod_Produto.Value)+' '+FormatFloat('R$ #,##0.00',QRProdutoEtiquetasVal_Varejo.Value));
        if VerificaVetor(Posicoes, 4) then
          Imp.WriteXY(9.3,3,FloatToStr(QRProdutoEtiquetasCod_Produto.Value)+' '+FormatFloat('R$ #,##0.00',QRProdutoEtiquetasVal_Varejo.Value));
        if VerificaVetor(Posicoes, 5) then
          Imp.WriteXY(12.3,3,FloatToStr(QRProdutoEtiquetasCod_Produto.Value)+' '+FormatFloat('R$ #,##0.00',QRProdutoEtiquetasVal_Varejo.Value));
      end
      //fim da terceira linha
      else
      //terceira linha (sem preço de venda)
      begin
        if VerificaVetor(Posicoes, 1) then
          Imp.WriteXY(0.3,3,FloatToStr(QRProdutoEtiquetasCod_Produto.Value));
        if VerificaVetor(Posicoes, 2) then
          Imp.WriteXY(3.2,3,FloatToStr(QRProdutoEtiquetasCod_Produto.Value));
        if VerificaVetor(Posicoes, 3) then
          Imp.WriteXY(6.3,3,FloatToStr(QRProdutoEtiquetasCod_Produto.Value));
        if VerificaVetor(Posicoes, 4) then
          Imp.WriteXY(9.3,3,FloatToStr(QRProdutoEtiquetasCod_Produto.Value));
        if VerificaVetor(Posicoes, 5) then
          Imp.WriteXY(12.3,3,FloatToStr(QRProdutoEtiquetasCod_Produto.Value));
      end;
      //fim da terceira linha


    end;
  end;
end;

Procedure TEtiquetas.EtiquetasPequenas(Preco: Integer; nEtiquetasImp, nEtiquetas:Integer);
var i, j:integer;
begin
  with DMProdutoRelatorio do
    begin
    for i:=1 to pNum_Linhas do
      begin
       if nEtiquetasImp >= 5 then
       begin
         Dec(nEtiquetasImp, 5);
         if DMParamSistema.QParamSistemaCod_Empresa.Text = 'CHAIANA' then
           for j := 1 to 2 do
           begin
             Imp.WriteXY(0,0,' ');
             Imp.SaltaPaginaEtiquetasChaiana; //procedimento de saltar paginas somente pra CHAIANA
           end
         else
           for j := 1 to 4 do
           begin
             Imp.WriteXY(0,0,' ');
             Imp.SaltaPaginaEtiquetas;
           end;
       end
       else
       begin
         case nEtiquetasImp of
         0:
         begin
           if nEtiquetas >= 5 then
           begin
             ImprimeEtiquetas([1, 2, 3, 4, 5], (Preco = 0));
             nEtiquetas := nEtiquetas - 5;
           end
           else
           begin
             case nEtiquetas of  //case do numero de etiquetas(nEtiquetasImp = 0)
             4:
             begin
               ImprimeEtiquetas([1, 2, 3, 4], (Preco = 0));
               nEtiquetas := 0;
             end;
             3:
             begin
               ImprimeEtiquetas([1, 2, 3], (Preco = 0));
               nEtiquetas := 0;
             end;
             2:
             begin
               ImprimeEtiquetas([1, 2], (Preco = 0));
               nEtiquetas := 0;
             end;
             1:
             begin
               ImprimeEtiquetas([1], (Preco = 0));
               nEtiquetas := 0;
             end;
             end; //fim - case do numero de etiquetas(nEtiquetasImp = 0)
           end;
         end;
         1:
         begin
           if nEtiquetas >= 4 then
           begin
             ImprimeEtiquetas([2, 3, 4, 5], (Preco = 0));
             nEtiquetas := nEtiquetas - 4;
           end
           else
             case nEtiquetas of //case do numero de etiquetas(nEtiquetasImp = 1)
              3:
              begin
               ImprimeEtiquetas([2, 3, 4], (Preco = 0));
               nEtiquetas := 0;
              end;
              2:
              begin
               ImprimeEtiquetas([2, 3], (Preco = 0));
               nEtiquetas := 0;
              end;
              1:
              begin
               ImprimeEtiquetas([2], (Preco = 0));
               nEtiquetas := 0;
              end;
             end;//fim - case do numero de etiquetas(nEtiquetasImp = 1)
         end;
         2:
         begin
           if nEtiquetas >= 3 then
           begin
             ImprimeEtiquetas([3, 4, 5], (Preco = 0));
             nEtiquetas := nEtiquetas - 3;
           end
           else
             case nEtiquetas of //case do numero de etiquetas(nEtiquetasImp = 2)
              2:
              begin
               ImprimeEtiquetas([3, 4], (Preco = 0));
               nEtiquetas := 0;
              end;
              1:
              begin
               ImprimeEtiquetas([3], (Preco = 0));
               nEtiquetas := 0;
              end;
             end; //fim - case do numero de etiquetas(nEtiquetasImp = 2)
         end;
         3:
         begin
           if nEtiquetas >= 2 then
           begin
             ImprimeEtiquetas([4, 5], (Preco = 0));
             nEtiquetas := nEtiquetas - 2;
           end
           else
             case nEtiquetas of //case do numero de etiquetas(nEtiquetasImp = 3)
               1:
               begin
                 ImprimeEtiquetas([4], (Preco = 0));
                 nEtiquetas := 0;
               end;
             end; //fim - case do numero de etiquetas(nEtiquetasImp = 3)
         end;
         4:
         begin
           if nEtiquetas >= 1 then
           begin
             ImprimeEtiquetas([5], (Preco = 0));
             nEtiquetas := nEtiquetas - 1;
           end;
         end;
         end;
         if DMParamSistema.QParamSistemaCod_Empresa.Text = 'CHAIANA' then
           Imp.SaltaPaginaEtiquetasChaiana //procedimento de saltar paginas somente pra CHAIANA
         else
           Imp.SaltaPaginaEtiquetas;
         nEtiquetasImp := 0;
       End;
      end
    end;
end;

end.
