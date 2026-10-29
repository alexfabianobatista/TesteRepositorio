
unit UBloqueto;

interface

uses SysUtils, Dialogs;

  Type
    TBloqueto = Class
    Private
      Procedure BancoRural;
      Procedure BancoBrasil;
      Procedure BancoBrasilTotal;
      Procedure BancoBradesco;
      Procedure BancoHsbc;
      Procedure BancoCaixaEconomica;
      Procedure Meridional;
      Procedure BancoBanestado;
      Procedure BancoItau;
      Procedure BancoSicredi;
    Public                                  // wModo= P -> parcial | T -> Total/completo
      Procedure EmiteBloqueto(Cod_Banco:Integer;wModo:String);
  End;

Var
  Bloqueto : TBloqueto;
  wInd,wLinha,wInicio : Integer;
  wInstrucao : String;

implementation

uses UBiblioteca, UContasReceber_Cl, UParamSistema_cl;

procedure TBloqueto.EmiteBloqueto(Cod_banco:Integer;wModo:String);
begin
  MessageDlg('Prepare impressora para emissão de Bloqueto!',mtWarning,[mbOk],0);
  if imp = Nil then
    imp:=TImp.Create;
  Imp.AbreImpressora;
  Case Cod_banco Of
    1: Begin
       Imp.ConfiguraImpressora('CONDENSADO_ON','OITAVOS',32);
       if wModo = 'P' then
          BancoBrasil
       else
          BancoBrasilTotal;
       end;
    2: Begin
       Imp.ConfiguraImpressora('CONDENSADO_ON','OITAVOS',32);
       BancoBradesco;
       End;
    3: Begin
       Imp.ConfiguraImpressora('CONDENSADO_ON','OITAVOS',32);
       BancoRural;
       End;
    4: Begin
       Imp.ConfiguraImpressora('CONDENSADO_ON','OITAVOS',32);
       BancoHsbc;
       End;
    5: Begin
       Imp.ConfiguraImpressora('CONDENSADO_ON','OITAVOS',32);
       BancoCaixaEconomica;
       End;
    6: Begin
       Imp.ConfiguraImpressora('CONDENSADO_ON','SEXTOS',24);
       Meridional;
       End;
    7: Begin
       Imp.ConfiguraImpressora('CONDENSADO_ON','OITAVOS',32);
       BancoBanestado;
       End;
    8: Begin
       Imp.ConfiguraImpressora('CONDENSADO_ON','OITAVOS',32);
       BancoItau;
       End;
    9: Begin
       Imp.ConfiguraImpressora('CONDENSADO_ON','OITAVOS',32);
       BancoSicredi;
       End;
  end;
{  Imp.SaltaPagina;}
  Imp.ConfiguraImpressora('CONDENSADO_OFF','SEXTOS',66);
  Imp.FechaImpressora;  // Finaliza os serviços de Impressao
end;

Procedure TBloqueto.BancoRural;
begin
  with DMContasReceber do
    begin
      QRBloqueto.First;
      while not(QRBloqueto.EOF) do
        begin
          Imp.WriteXY(0.5,1,QRBloquetoDesc_Local_Pgto_Bloq.Value);
          If DmContasReceber.pVencimentoBloqueto = 'S' Then
             Imp.WriteXY(17.5,1,QRBloquetoDt_Vencimento.Text)
          Else
             Imp.WriteXY(13,2,'APRESENTACAO');
          Imp.WriteXY(0.5,5,QRBloquetoDt_Emissao.Text);
          Imp.WriteXY(3,5,QRBloquetoNum_Titulo.Text+'/'+QRBloquetoNum_Parcela.Text);
          Imp.WriteXY(7.5,5,QRBloquetoDesc_Tipo_Documento.Value);
          Imp.WriteXY(12,5,DateToStr(Date));
          Imp.WriteXY(17,7,FORMATFLOAT('#,###,##0.00',DMContasReceber.QRBloquetoVal_Titulo.VALUE));
          Imp.WriteXY(0.5,11,QRBloquetoInstrucao_Juro.Value);
          wInd := 1; // esta rotina abaixo procura pela tecla enter dentro da string
          wInicio := 1;
          wLinha := 12;
          While wInd <= Length(Trim(QRBloquetoDesc_Instrucao_Bloqueto.Text)) do
          Begin
             If Copy(QRBloquetoDesc_Instrucao_Bloqueto.Value,wInd,1) = chr(13) Then
              Begin
                wInstrucao := Copy(QRBloquetoDesc_Instrucao_Bloqueto.Value,wInicio,wInd-wInicio);
                Imp.WriteXY(0.5,wLinha,wInstrucao);
                wInicio := wInd + 2;
                Inc(wLinha);
              End;
             Inc(wInd);
          end;
          wInstrucao := Copy(QRBloquetoDesc_Instrucao_Bloqueto.Value,wInicio,wInd-1);
          Imp.WriteXY(0.5,wLinha,wInstrucao);
          if QRBloquetoCod_Vendedor.Text <> '' then
             Imp.WriteXY(0.5,17,'Vend:'+QRBloquetoCod_Vendedor.Text+' - '+QRBloquetoNome_Vendedor.Text);
          Imp.WriteXY(1.5,19,QRBloquetoCod_Cadastro.Text+' - '+QRBloquetoNome_Sacado.Text);
          Imp.WriteXY(1.5,20,Trim(QRBloquetoDesc_endereco_Cobranca.Value)+' - '+Trim(QRBloquetoDesc_Bairro.Value));
          Imp.WriteXY(1.5,21,QRBloquetoDesc_cidade_Cobranca.Text+' - '+QRBloquetoDesc_estado_Cobranca.Text+' - '+QRBloquetoDesc_Cep_Cobranca.Text);
          Imp.WriteXY(1.5,22,QRBloquetoNum_Cgc_Cpf.Text+' - '+QRBloquetoDesc_Telefone.Text);
          Imp.SaltaPagina;
          QRBloqueto.Next;
        end;
    end;
end;

procedure TBloqueto.BancoBrasil;
begin
  with DMContasReceber do
  begin
    QRBloqueto.First;
    while not(QRBloqueto.EOF) do
    begin
      Imp.WriteXY(0.5,1,QRBloquetoDESC_LOCAL_PGTO_BLOQ.Value);
      If DmContasReceber.pVencimentoBloqueto = 'S' Then
         Imp.WriteXY(13.5,1,QRBloquetoDT_VENCIMENTO.Text)
      Else
         Imp.WriteXY(13,2,'APRESENTACAO');
      Imp.WriteXY(0.5,5,QRBloquetoDT_EMISSAO.Text);
      Imp.WriteXY(4,5,QRBloquetoNUM_TITULO.Text+'/'+QRBloquetoNUM_PARCELA.Text);
      Imp.WriteXY(8,5,QRBloquetoDESC_TIPO_DOCUMENTO.Value);
      Imp.WriteXY(10.5,5,DateToStr(Date));
      Imp.WriteXY(14,7,FormatFloat('#,###,##0.00',DMContasReceber.QRBloquetoVal_Titulo.Value));
      if wDescontoBloqueto <> '' THEN
        Imp.WriteXY(14,9,FormatFloat('#,###,##0.00',((DMContasReceber.QRBloquetoVal_Titulo.VALUE *
                                                     StrToFloat(wDescontoBloqueto))/100) ));
      Imp.WriteXY(0.5,10,QRBloquetoInstrucao_Juro.Value);
      wInd := 1; // esta rotina abaixo procura pela tecla enter dentro da string
      wInicio := 1;
      wLinha := 11;
      While wInd <= Length(Trim(QRBloquetoDesc_Instrucao_Bloqueto.Text)) do
      Begin
        If Copy(QRBloquetoDesc_Instrucao_Bloqueto.Value,wInd,1) = chr(13) Then
        Begin
          wInstrucao := Copy(QRBloquetoDESC_INSTRUCAO_BLOQUETO.Value,wInicio,wInd-wInicio);
          Imp.WriteXY(0.5,wLinha,wInstrucao);
          wInicio := wInd + 2;
          Inc(wLinha);
        End;
        Inc(wInd);
      End;
      wInstrucao := Copy(QRBloquetoDesc_Instrucao_Bloqueto.Value,wInicio,wInd-1);
      Imp.WriteXY(0.5,wLinha,wInstrucao);
      if ((QRBloquetoCod_Vendedor.Text <> '') and (DMParamSistema.QParamSistemaCod_empresa.Value <> 'LUNASA')) then
         Imp.WriteXY(0.5,17,'Vend:'+QRBloquetoCod_Vendedor.Text+' - '+QRBloquetoNome_Vendedor.Text);
      Imp.WriteXY(1.5,19,QRBloquetoCod_Cadastro.Text+' - '+QRBloquetoNome_Sacado.Text);
      Imp.WriteXY(1.5,20,Trim(QRBloquetoDesc_endereco_Cobranca.Text)+' - '+QRBloquetoDesc_cidade_Cobranca.Text+' - '+QRBloquetoDesc_estado_Cobranca.Text+' - '+QRBloquetoDesc_Cep_Cobranca.Text);
      Imp.WriteXY(1.5,21,QRBloquetoNum_Cgc_Cpf.Text+' - '+QRBloquetoDesc_Telefone.Text);
      Imp.WriteXY(1.5,22,QRBloquetoDesc_Bairro.Text);
      Imp.SaltaPagina;
      QRBloqueto.Next;
    end;
  end;
end;

Procedure TBloqueto.BancoBradesco;
begin
  with DMContasReceber do
    begin
      QRBloqueto.First;
      while not(QRBloqueto.EOF) do
        begin
          Imp.WriteXY(0.5,1,QRBloquetoDesc_Local_Pgto_Bloq.Value);
          If DmContasReceber.pVencimentoBloqueto = 'S' Then
             Imp.WriteXY(12.5,1,QRBloquetoDt_Vencimento.Text)
          Else
             Imp.WriteXY(13,2,'APRESENTACAO');
          Imp.WriteXY(0.5,5,QRBloquetoDt_Emissao.Text);
          Imp.WriteXY(3.5,5,QRBloquetoNum_Titulo.Text+'/'+QRBloquetoNum_Parcela.Text);
          Imp.WriteXY(6.5,5,QRBloquetoDesc_Tipo_Documento.Value);
          Imp.WriteXY(9.5,5,DateToStr(Date));
          Imp.WriteXY(13,7,FormatFloat('#,###,##0.00',DMContasReceber.QRBloquetoVal_Titulo.VALUE));
          if wDescontoBloqueto <> '' THEN
            Imp.WriteXY(14,9,FormatFloat('#,###,##0.00',((DMContasReceber.QRBloquetoVal_Titulo.VALUE *
                                                          StrToFloat(wDescontoBloqueto))/100) ));
          Imp.WriteXY(0.5,13,QRBloquetoInstrucao_Juro.Value);
          wInd := 1; // esta rotina abaixo procura pela tecla enter dentro da string
          wInicio := 1;
          wLinha := 14;
          While wInd <= Length(Trim(QRBloquetoDesc_Instrucao_Bloqueto.Text)) do
          Begin
             If Copy(QRBloquetoDesc_Instrucao_Bloqueto.Value,wInd,1) = chr(13) Then
              Begin
                wInstrucao := Copy(QRBloquetoDesc_Instrucao_Bloqueto.Value,wInicio,wInd-wInicio);
                Imp.WriteXY(0.5,wLinha,wInstrucao);
                wInicio := wInd + 2;
                Inc(wLinha);
              End;
             Inc(wInd);
          end;
          wInstrucao := Copy(QRBloquetoDesc_Instrucao_Bloqueto.Value,wInicio,wInd-1);
          Imp.WriteXY(0.5,wLinha,wInstrucao);
          if QRBloquetoCod_Vendedor.Text <> '' then
             Imp.WriteXY(0.5,17,'Vend:'+QRBloquetoCod_Vendedor.Text+' - '+QRBloquetoNome_Vendedor.Text);
          Imp.WriteXY(1.5,19,QRBloquetoCod_Cadastro.Text+' - '+QRBloquetoNome_Sacado.Text);
          Imp.WriteXY(1.5,20,Trim(QRBloquetoDesc_endereco_Cobranca.Value)+' - '+Trim(QRBloquetoDesc_Bairro.Value));
          Imp.WriteXY(1.5,21,QRBloquetoDesc_cidade_Cobranca.Text+' - '+QRBloquetoDesc_estado_Cobranca.Text+' - '+QRBloquetoDesc_Cep_Cobranca.Text);
          Imp.WriteXY(1.5,22,QRBloquetoNum_Cgc_Cpf.Text+' - '+QRBloquetoDesc_Telefone.Text);
          Imp.SaltaPagina;
          QRBloqueto.Next;
        end;
    end;
end;

Procedure TBloqueto.BancoHsbc;
Begin
  with DMContasReceber do
    begin
      QRBloqueto.First;
      while not(QRBloqueto.EOF) do
        begin
          Imp.WriteXY(0.5,1,QRBloquetoDesc_Local_Pgto_Bloq.Value);
          If DmContasReceber.pVencimentoBloqueto = 'S' Then
             Imp.WriteXY(15.5,1,QRBloquetoDt_Vencimento.Text)
          Else
             Imp.WriteXY(13,2,'APRESENTACAO');
          Imp.WriteXY(0.5,6,QRBloquetoDt_Emissao.Text);
          Imp.WriteXY(4.5,6,QRBloquetoNum_Titulo.Text+'/'+QRBloquetoNum_Parcela.Text);
//          Imp.WriteXY(7.5,6,QRBloquetoDesc_Tipo_Documento.Value);
          Imp.WriteXY(11,6,DateToStr(Date));
          Imp.WriteXY(15,8,FORMATFLOAT('#,###,##0.00',DMContasReceber.QRBloquetoVal_Titulo.VALUE));
          Imp.WriteXY(0.5,13,QRBloquetoInstrucao_Juro.Value);
          wInd := 1; // esta rotina abaixo procura pela tecla enter dentro da string
          wInicio := 1;
          wLinha := 14;
          While wInd <= Length(Trim(QRBloquetoDesc_Instrucao_Bloqueto.Text)) do
          Begin
             If Copy(QRBloquetoDesc_Instrucao_Bloqueto.Value,wInd,1) = chr(13) Then
              Begin
                wInstrucao := Copy(QRBloquetoDesc_Instrucao_Bloqueto.Value,wInicio,wInd-wInicio);
                Imp.WriteXY(0.5,wLinha,wInstrucao);
                wInicio := wInd + 2;
                Inc(wLinha);
              End;
             Inc(wInd);
          end;
          wInstrucao := Copy(QRBloquetoDesc_Instrucao_Bloqueto.Value,wInicio,wInd-1);
          Imp.WriteXY(0.5,wLinha,wInstrucao);
          if QRBloquetoCod_Vendedor.Text <> '' then
             Imp.WriteXY(0.5,17,'Vend:'+QRBloquetoCod_Vendedor.Text+' - '+QRBloquetoNome_Vendedor.Text);
          Imp.WriteXY(1.5,20,QRBloquetoCod_Cadastro.Text+' - '+QRBloquetoNome_Sacado.Text);
          Imp.WriteXY(1.5,21,Trim(QRBloquetoDesc_endereco_Cobranca.Value)+' - '+Trim(QRBloquetoDesc_Bairro.Value));
          Imp.WriteXY(1.5,22,QRBloquetoDesc_cidade_Cobranca.Text+' - '+QRBloquetoDesc_estado_Cobranca.Text+' - '+QRBloquetoDesc_Cep_Cobranca.Text);
          Imp.WriteXY(1.5,23,QRBloquetoNum_Cgc_Cpf.Text+' - '+QRBloquetoDesc_Telefone.Text);
          Imp.SaltaPagina;
          QRBloqueto.Next;
        end;
    end;
end;

Procedure TBloqueto.BancoCaixaEconomica;
begin
  with DMContasReceber do
    begin
      QRBloqueto.First;
      while not(QRBloqueto.EOF) do
        begin
          Imp.WriteXY(0.5,2,QRBloquetoDesc_Local_Pgto_Bloq.Value);
          if DmContasReceber.pVencimentoBloqueto = 'S' Then
             Imp.WriteXY(13,2,QRBloquetoDt_Vencimento.Text)
          Else
             Imp.WriteXY(13,2,'APRESENTACAO');
          Imp.WriteXY(0.5,7,QRBloquetoDt_Emissao.Text);
          Imp.WriteXY(4,7,QRBloquetoNum_Titulo.Text+'/'+QRBloquetoNum_Parcela.Text);
          Imp.WriteXY(6.5,7,QRBloquetoDesc_Tipo_Documento.Value);
//          Imp.WriteXY(12,4,DateToStr(Date));
          Imp.WriteXY(14,9,FORMATFLOAT('#,###,##0.00',DMContasReceber.QRBloquetoVal_Titulo.VALUE));
          Imp.WriteXY(0.5,13,QRBloquetoInstrucao_Juro.Value);
          wInd := 1; // esta rotina abaixo procura pela tecla enter dentro da string
          wInicio := 1;
          wLinha := 14;
          While wInd <= Length(Trim(QRBloquetoDesc_Instrucao_Bloqueto.Text)) do
          Begin
             If Copy(QRBloquetoDesc_Instrucao_Bloqueto.Value,wInd,1) = chr(13) Then
              Begin
                wInstrucao := Copy(QRBloquetoDesc_Instrucao_Bloqueto.Value,wInicio,wInd-wInicio);
                Imp.WriteXY(0.5,wLinha,wInstrucao);
                wInicio := wInd + 2;
                Inc(wLinha);
              End;
             Inc(wInd);
          end;
          wInstrucao := Copy(QRBloquetoDesc_Instrucao_Bloqueto.Value,wInicio,wInd-1);
          Imp.WriteXY(0.5,wLinha,wInstrucao);
          if QRBloquetoCod_Vendedor.Text <> '' then
             Imp.WriteXY(0.5,17,'Vend:'+QRBloquetoCod_Vendedor.Text+' - '+QRBloquetoNome_Vendedor.Text);
          Imp.WriteXY(1.5,20,QRBloquetoCod_Cadastro.Text+' - '+QRBloquetoNome_Sacado.Text);
          Imp.WriteXY(1.5,21,Trim(QRBloquetoDesc_endereco_Cobranca.Value)+' - '+Trim(QRBloquetoDesc_Bairro.Value));
          Imp.WriteXY(1.5,22,QRBloquetoDesc_cidade_Cobranca.Text+' - '+QRBloquetoDesc_estado_Cobranca.Text+' - '+QRBloquetoDesc_Cep_Cobranca.Text);
          Imp.WriteXY(1.5,23,QRBloquetoNum_Cgc_Cpf.Text+' - '+QRBloquetoDesc_Telefone.Text);
          Imp.SaltaPagina;
          QRBloqueto.Next;
        end;
    end;
end;

procedure TBloqueto.Meridional;
begin
  with DMContasReceber do
    begin
      QRBloqueto.First;
      while not(QRBloqueto.EOF) do
        begin
          Imp.WriteXY(0.5,1,QRBloquetoDesc_Local_Pgto_Bloq.Value);
          If DmContasReceber.pVencimentoBloqueto = 'S' Then
             Imp.WriteXY(13,1,QRBloquetoDt_Vencimento.Text)
          Else
             Imp.WriteXY(13,2,'APRESENTACAO');
          Imp.WriteXY(0.5,4,QRBloquetoDt_Emissao.Text);
          Imp.WriteXY(3,4,QRBloquetoNum_Titulo.Text+'/'+QRBloquetoNum_Parcela.Text);
          Imp.WriteXY(8,4,QRBloquetoDesc_Tipo_Documento.Value);
          Imp.WriteXY(10,4,DateToStr(Date));
          Imp.WriteXY(13,6,QRBloquetoVal_Titulo.Text);
          Imp.WriteXY(0.5,9,QRBloquetoInstrucao_Juro.Value);
          wInd := 1; // esta rotina abaixo procura pela tecla enter dentro da string
          wInicio := 1;
          wLinha := 10;
          While wInd <= Length(Trim(QRBloquetoDesc_Instrucao_Bloqueto.Text)) do
          Begin
             If Copy(QRBloquetoDesc_Instrucao_Bloqueto.Value,wInd,1) = chr(13) Then
              Begin
                wInstrucao := Copy(QRBloquetoDesc_Instrucao_Bloqueto.Value,wInicio,wInd-wInicio);
                Imp.WriteXY(0.5,wLinha,wInstrucao);
                wInicio := wInd + 2;
                Inc(wLinha);
              End;
             Inc(wInd);
          end;
          wInstrucao := Copy(QRBloquetoDesc_Instrucao_Bloqueto.Value,wInicio,wInd-1);
          Imp.WriteXY(0.5,wLinha,wInstrucao);
          if QRBloquetoCod_Vendedor.Text <> '' then
             Imp.WriteXY(0.5,13,'Vend:'+QRBloquetoCod_Vendedor.Text+' - '+QRBloquetoNome_Vendedor.Text);
          Imp.WriteXY(1.5,14,QRBloquetoCod_Cadastro.Text+' - '+QRBloquetoNome_Sacado.Text);
          Imp.WriteXY(1.5,15,Trim(QRBloquetoDesc_endereco_Cobranca.Text)+' - '+Trim(QRBloquetoDesc_cidade_Cobranca.Value)+' - '+QRBloquetoDesc_estado_Cobranca.Text);
          Imp.WriteXY(1.5,16,QRBloquetoDesc_Cep_Cobranca.Text+' - '+QRBloquetoNum_Cgc_Cpf.Text+' - '+QRBloquetoDesc_Telefone.Text);
          Imp.WriteXY(1.5,17,QRBloquetoDesc_Bairro.Text);
          Imp.SaltaPagina;
          QRBloqueto.Next;
        end;
    end;
end;

procedure TBloqueto.BancoBanestado;
begin
  with DMContasReceber do
    begin
      QRBloqueto.First;
      while not(QRBloqueto.EOF) do
        begin
          Imp.WriteXY(0.5,1,QRBloquetoDesc_Local_Pgto_Bloq.Value);
          If DmContasReceber.pVencimentoBloqueto = 'S' Then
             Imp.WriteXY(13.5,1,QRBloquetoDt_Vencimento.Text)
          Else
             Imp.WriteXY(13,2,'APRESENTACAO');
          Imp.WriteXY(0.5,5,QRBloquetoDt_Emissao.Text);
          Imp.WriteXY(4,5,QRBloquetoNum_Titulo.Text+'/'+QRBloquetoNum_Parcela.Text);
          Imp.WriteXY(7,5,QRBloquetoDesc_Tipo_Documento.Value);
          Imp.WriteXY(10.5,5,DateToStr(Date));
          Imp.WriteXY(14,7,FORMATFLOAT('#,###,##0.00',DMContasReceber.QRBloquetoVal_Titulo.VALUE));
          Imp.WriteXY(0.5,11,QRBloquetoInstrucao_Juro.Value);
          wInd := 1; // esta rotina abaixo procura pela tecla enter dentro da string
          wInicio := 1;
          wLinha := 12;
          While wInd <= Length(Trim(QRBloquetoDesc_Instrucao_Bloqueto.Text)) do
          Begin
             If Copy(QRBloquetoDesc_Instrucao_Bloqueto.Value,wInd,1) = chr(13) Then
              Begin
                wInstrucao := Copy(QRBloquetoDesc_Instrucao_Bloqueto.Value,wInicio,wInd-wInicio);
                Imp.WriteXY(0.5,wLinha,wInstrucao);
                wInicio := wInd + 2;
                Inc(wLinha);
              End;
             Inc(wInd);
          end;
          wInstrucao := Copy(QRBloquetoDesc_Instrucao_Bloqueto.Value,wInicio,wInd-1);
          Imp.WriteXY(0.5,wLinha,wInstrucao);
          if QRBloquetoCod_Vendedor.Text <> '' then
             Imp.WriteXY(0.5,16,'Vend:'+QRBloquetoCod_Vendedor.Text+' - '+QRBloquetoNome_Vendedor.Text);
          Imp.WriteXY(1.5,18,QRBloquetoCod_Cadastro.Text+' - '+QRBloquetoNome_Sacado.Text);
          Imp.WriteXY(1.5,19,Trim(QRBloquetoDesc_endereco_Cobranca.Text)+' - '+Trim(QRBloquetoDesc_cidade_Cobranca.Text)+' - '+Trim(QRBloquetoDesc_estado_Cobranca.Text)+' - '+QRBloquetoDesc_Cep_Cobranca.Text);
          Imp.WriteXY(1.5,20,QRBloquetoNum_Cgc_Cpf.Text+' - '+QRBloquetoDesc_Telefone.Text);
          Imp.WriteXY(1.5,21,QRBloquetoDesc_Bairro.Text);
          Imp.SaltaPagina;
          QRBloqueto.Next;
        end;
    end;
end;

procedure TBloqueto.BancoBrasilTotal;
begin
 { with DMContasReceber do
    begin
      QRBloqueto.First;
      while not(QRBloqueto.EOF) do
        begin
          Imp.WriteXY(0.5,1,QRBloquetoDesc_Local_Pgto_Bloq.Value);
          If DmContasReceber.pVencimentoBloqueto = 'S' Then
             Imp.WriteXY(13.5,1,QRBloquetoDt_Vencimento.Text);
          Imp.WriteXY(0.5,5,QRBloquetoDt_Emissao.Text);
          Imp.WriteXY(4,5,QRBloquetoNum_Titulo.Text+'/'+QRBloquetoNum_Parcela.Text);
          Imp.WriteXY(8,5,QRBloquetoDesc_Tipo_Documento.Value);
          Imp.WriteXY(10.5,5,DateToStr(Date));
          Imp.WriteXY(14,7,FORMATFLOAT('#,###,##0.00',DMContasReceber.QRBloquetoVal_Titulo.VALUE));
          Imp.WriteXY(0.5,10,QRBloquetoInstrucao_Juro.Value);
          wInd := 1; // esta rotina abaixo procura pela tecla enter dentro da string
          wInicio := 1;
          wLinha := 11;
          while wInd <= Length(Trim(QRBloquetoDesc_Instrucao_Bloqueto.Text)) do
          begin
             if Copy(QRBloquetoDesc_Instrucao_Bloqueto.Value,wInd,1) = chr(13) Then
             begin
                wInstrucao := Copy(QRBloquetoDesc_Instrucao_Bloqueto.Value,wInicio,wInd-wInicio);
                Imp.WriteXY(0.5,wLinha,wInstrucao);
                wInicio := wInd + 2;
                Inc(wLinha);
             end;
             Inc(wInd);
          end;
          wInstrucao := Copy(QRBloquetoDesc_Instrucao_Bloqueto.Value,wInicio,wInd-1);
          Imp.WriteXY(0.5,wLinha,wInstrucao);
          if QRBloquetoCod_Vendedor.Text <> '' then
             Imp.WriteXY(0.5,17,'Vend:'+QRBloquetoCod_Vendedor.Text+' - '+QRBloquetoNome_Vendedor.Text);
          Imp.WriteXY(1.5,19,QRBloquetoCod_Cadastro.Text+' - '+QRBloquetoNome_Sacado.Text);
          Imp.WriteXY(1.5,20,Trim(QRBloquetoDesc_endereco_Cobranca.Text)+' - '+QRBloquetoDesc_cidade_Cobranca.Text+' - '+QRBloquetoDesc_estado_Cobranca.Text+' - '+QRBloquetoDesc_Cep_Cobranca.Text);
          Imp.WriteXY(1.5,21,QRBloquetoNum_Cgc_Cpf.Text+' - '+QRBloquetoDesc_Telefone.Text);
          Imp.WriteXY(1.5,22,QRBloquetoDesc_Bairro.Text);
          Inc(wLinha);
          Imp.WriteXY(0.5,wLinha,QRBloquetoCOD_NOTA_CAB.Text);
          Imp.SaltaPagina;
          QRBloqueto.Next;
        end;
    end;
  }
end;

procedure TBloqueto.BancoItau;
begin
  //
end;
procedure TBloqueto.BancoSicredi;
begin
  with DMContasReceber do
    begin
      QRBloqueto.First;
      while not(QRBloqueto.EOF) do
        begin
          Imp.WriteXY(0.5,1,QRBloquetoDesc_Local_Pgto_Bloq.Value);
          If DmContasReceber.pVencimentoBloqueto = 'S' Then
             Imp.WriteXY(13.5,1,QRBloquetoDt_Vencimento.Text)
          Else
             Imp.WriteXY(13,2,'APRESENTACAO');
          Imp.WriteXY(0.5,5,QRBloquetoDt_Emissao.Text);
          Imp.WriteXY(4,5,QRBloquetoNum_Titulo.Text+'/'+QRBloquetoNum_Parcela.Text);
          Imp.WriteXY(7,5,QRBloquetoDesc_Tipo_Documento.Value);
          Imp.WriteXY(10.5,5,DateToStr(Date));
          Imp.WriteXY(14,7,FORMATFLOAT('#,###,##0.00',DMContasReceber.QRBloquetoVal_Titulo.VALUE));
          if wDescontoBloqueto <> '' Then
            Imp.WriteXY(14,9,FormatFloat('#,###,##0.00',((DMContasReceber.QRBloquetoVal_Titulo.VALUE *
                                                          StrToFloat(wDescontoBloqueto))/100) ));
          Imp.WriteXY(0.5,11,QRBloquetoInstrucao_Juro.Value);
          wInd := 1; // esta rotina abaixo procura pela tecla enter dentro da string
          wInicio := 1;
          wLinha := 12;
          While wInd <= Length(Trim(QRBloquetoDesc_Instrucao_Bloqueto.Text)) do
          Begin
             If Copy(QRBloquetoDesc_Instrucao_Bloqueto.Value,wInd,1) = chr(13) Then
              Begin
                wInstrucao := Copy(QRBloquetoDesc_Instrucao_Bloqueto.Value,wInicio,wInd-wInicio);
                Imp.WriteXY(0.5,wLinha,wInstrucao);
                wInicio := wInd + 2;
                Inc(wLinha);
              End;
             Inc(wInd);
          end;
          wInstrucao := Copy(QRBloquetoDesc_Instrucao_Bloqueto.Value,wInicio,wInd-1);
          Imp.WriteXY(0.5,wLinha,wInstrucao);
          if QRBloquetoCod_Vendedor.Text <> '' then
             Imp.WriteXY(0.5,16,'Vend:'+QRBloquetoCod_Vendedor.Text+' - '+QRBloquetoNome_Vendedor.Text);
          Imp.WriteXY(1.5,18,QRBloquetoCod_Cadastro.Text+' - '+QRBloquetoNome_Sacado.Text);
          Imp.WriteXY(1.5,19,Trim(QRBloquetoDesc_endereco_Cobranca.Text)+' - '+Trim(QRBloquetoDesc_cidade_Cobranca.Text)+' - '+Trim(QRBloquetoDesc_estado_Cobranca.Text)+' - '+QRBloquetoDesc_Cep_Cobranca.Text);
          Imp.WriteXY(1.5,20,QRBloquetoNum_Cgc_Cpf.Text+' - '+QRBloquetoDesc_Telefone.Text);
          Imp.WriteXY(1.5,21,QRBloquetoDesc_Bairro.Text);
          Imp.SaltaPagina;
          QRBloqueto.Next;
        end;
    end;
end;

end.
