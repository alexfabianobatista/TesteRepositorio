unit UPrecos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, Mask, variants, ComCtrls;

type
  TFPrecoCad = class(TForm)
    SpeedButton3: TSpeedButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    GBPromocao: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label11: TLabel;
    MEPrecoPromocao: TMaskEdit;
    MEDt_Inicial: TMaskEdit;
    MEDt_Final: TMaskEdit;
    MeComplemento: TMaskEdit;
    MePrecoPromocao1: TMaskEdit;
    RGAtualizarPor: TRadioGroup;
    GBAlteracaoPreco: TGroupBox;
    LPrecoVarMax: TLabel;
    LPrecoAtacMin: TLabel;
    LPercVarMax: TLabel;
    LPercAtacMin: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    MEPrecoVarejo: TMaskEdit;
    MEPrecoAtacado: TMaskEdit;
    MEPercVarejo: TMaskEdit;
    MEPercAtacado: TMaskEdit;
    MePrecoFrete: TMaskEdit;
    MeDtVenctoPreco: TMaskEdit;
    SBPrecoPromocao: TSpeedButton;
    GBDados: TGroupBox;
    BtProduto: TSpeedButton;
    BtClasse: TSpeedButton;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label9: TLabel;
    Label13: TLabel;
    SbFornecedor: TSpeedButton;
    MECodProduto: TMaskEdit;
    MEProduto: TMaskEdit;
    MEClasse: TMaskEdit;
    MESubClasse: TMaskEdit;
    MEDescClasse: TMaskEdit;
    MeCadastro: TMaskEdit;
    Label2: TLabel;
    MECodProduto2: TMaskEdit;
    BtProduto2: TSpeedButton;
    MEProduto2: TMaskEdit;
    TabSheet3: TTabSheet;
    GBClasseCons: TGroupBox;
    SBClassePromoCons: TSpeedButton;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    MEClassePromo: TMaskEdit;
    MeSubClassePromo: TMaskEdit;
    MeDescClassePromo: TMaskEdit;
    Label10: TLabel;
    MEComplementoPromo: TMaskEdit;
    Label18: TLabel;
    MEDtIniClassePromo: TMaskEdit;
    Label19: TLabel;
    MePercDesconto: TMaskEdit;
    MeDtFimClassePromo: TMaskEdit;
    procedure BtClasseClick(Sender: TObject);
    procedure BtProdutoClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RGAtualizarPorClick(Sender: TObject);
    procedure MECodProdutoChange(Sender: TObject);
    procedure SBPrecoPromocaoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SbFornecedorClick(Sender: TObject);
    procedure BtProduto2Click(Sender: TObject);
    procedure MECodProduto2Exit(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure SBClassePromoConsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPrecoCad: TFPrecoCad;

implementation

uses UClasseCons, UClasse_cl, UProdutoCons, UProduto_cl, UParamSistema_cl,
  UOracle_cl, UCadastroCons, UPrecos_cl, UCadastro_cl, Math;

{$R *.DFM}

procedure TFPrecoCad.BtClasseClick(Sender: TObject);
begin
  If FClasseCons=Nil then
    FClasseCons:=TFClasseCons.Create(Application);
  If FClasseCons.ShowModal=mrOk then
    Begin
      MEClasse.Text:=FloatToSTr(DMClasse.QClasseConsNum_Classe.value);
      MESubClasse.text:=FloatToStr(DMClasse.QClasseConsNum_SubClasse.value);
      MEDescClasse.Text:=DMClasse.QClasseConsDesc_Classe.value;
      MECodProduto.Text:='';
      MEProduto.text:='';
    end;

end;

procedure TFPrecoCad.BtProdutoClick(Sender: TObject);
begin
  If FProdutoCons=Nil then
    FProdutoCons:=TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal=mrOk then
    Begin
      MECodProduto.Text:=FloatToSTr(DMProduto.QProdutoConsCod_Produto.value);
//      MEProduto.text:=DMProduto.QProdutoConsDesc_Produto.value;
      MEDescClasse.Text:='';
      MEClasse.Text:='';
      MESubClasse.text:='';
    end;
end;

procedure TFPrecoCad.SpeedButton3Click(Sender: TObject);
var
  wvlr_promocao,wvlr_promocao1,wpct_varejo,wpct_atacado,wvlr_varejo,wvlr_atacado,wvlr_frete : real;
  wDataI,wDataF:TDateTime;
  wComplemento:String;
  wCont : integer;
begin
  wCont := 0;
  wpct_varejo:=0;
  wpct_atacado:=0;
  wvlr_Promocao:=0;
  wvlr_frete := 0;
  wDataI:=0;
  wDataF:=0;
  Try
    DMOracle.DBCemapa.StartTransaction;
    if (PageControl1.ActivePageIndex = 0) then
    begin
      If RGAtualizarPor.Itemindex=0 then // Atualizar pelo Percentual
        Begin
          If (trim(MePercVarejo.text)<>'') then
          try
            wpct_varejo:=StrToFloat(MePercVarejo.text);
          except
            raise Exception.Create('Valor do Percentual Varejo Inválido!');
          end;
          If (trim(MePercAtacado.text)<>'') then
          try
            wpct_atacado:=StrToFloat(MePercAtacado.text);
          except
            raise Exception.Create('Valor do Percentual Atacado Inválido!');
          end;
          wpct_varejo:=1+(wpct_varejo/100);
          wpct_atacado:=1+(wpct_atacado/100);
          If (trim(MECodProduto.Text)<>'') then
            DMPrecos.QAtualizaPrecoPerc.SetVariable('COD_PRODUTO',MECodProduto.Text)
          Else
            DMPrecos.QAtualizaPrecoPerc.SetVariable('COD_PRODUTO',Null);
          If (trim(MeCadastro.Text)<>'') then
            DMPrecos.QAtualizaPrecoPerc.SetVariable('COD_CADASTRO',MeCadastro.Text)
          Else
            DMPrecos.QAtualizaPrecoPerc.SetVariable('COD_CADASTRO',Null);
          If Trim(MEClasse.Text)<>'' then
            DMPrecos.QAtualizaPrecoPerc.SetVariable('NUM_CLASSE',MEClasse.Text)
          Else
            DMPrecos.QAtualizaPrecoPerc.SetVariable('NUM_CLASSE',Null);
          If (Trim(MESubClasse.Text)<>'') or (Trim(MESubClasse.Text)='0') then   //caso a subclasse esteja vazia ou seja igual a zero atualiza todos daquela classe
            DMPrecos.QAtualizaPrecoPerc.SetVariable('NUM_SUBCLASSE',MESubClasse.Text)
          Else
            DMPrecos.QAtualizaPrecoPerc.SetVariable('NUM_SUBCLASSE',Null);
          DMPrecos.QAtualizaPrecoPerc.SetVariable('PERC_VAREJO',wpct_varejo);
          DMPrecos.QAtualizaPrecoPerc.SetVariable('PERC_ATACADO',wpct_atacado);
          DMPrecos.QAtualizaPrecoPerc.ExecSQL;
          MessageDlg('Preço dos Produtos Atualizados!',mtInformation,[mbOk],0);
        End   // Fim da Atualização por percentual
      Else    // Atualizar por preço
        Begin
          If (MECodProduto.Text<>'') then
            Begin
              If (trim(MEPrecoAtacado.Text)<>'') then // Atualiza Preco no Atacado
                Begin
                    try
                       wvlr_atacado:=StrToFloat(MePrecoAtacado.text);
                    except
                      raise Exception.Create('Valor do Preço Atacado Inválido!');
                    end;
                    DMPrecos.QAtualizaPrecoAtacado.SetVariable('COD_PRODUTO',MeCodProduto.Text);
                    DMPrecos.QAtualizaPrecoAtacado.SetVariable('PRECO_ATACADO',wvlr_atacado);
                    DMPrecos.QAtualizaPrecoAtacado.SetVariable('DT_VENCTO_PRECO',StrToDate(MeDtVenctoPreco.Text));
                    DMPrecos.QAtualizaPrecoAtacado.ExecSQL;
                End;
              If (trim(MEPrecoVarejo.Text)<>'') then // Atualiza Preco no Varejo
                Begin
                    try
                       wvlr_varejo:=StrToFloat(MEPrecoVarejo.text);
                    except
                      raise Exception.Create('Valor do Preço Varejo Inválido!');
                    end;
                    DMPrecos.QAtualizaPrecoVarejo.SetVariable('COD_PRODUTO',MeCodProduto.Text);
                    DMPrecos.QAtualizaPrecoVarejo.SetVariable('PRECO_VAREJO',wvlr_varejo);
                    DMPrecos.QAtualizaPrecoVarejo.SetVariable('DT_VENCTO_PRECO',StrToDate(MeDtVenctoPreco.Text));
                    DMPrecos.QAtualizaPrecoVarejo.ExecSQL;
                End;
              If (trim(MEPrecoFrete.Text)<>'') then // Atualiza Preco no frete
                Begin
                    try
                       wvlr_frete:=StrToFloat(MePrecoFrete.text);
                    except
                      raise Exception.Create('Valor do Preço Frete Inválido!');
                    end;
                    DMPrecos.QAtualizaPrecoFrete.SetVariable('COD_PRODUTO',MeCodProduto.Text);
                    DMPrecos.QAtualizaPrecoFrete.SetVariable('PRECO_FRETE',wvlr_frete);
                    DMPrecos.QAtualizaPrecoFrete.ExecSQL;
                End;
            End;
        End;
    end;
    if (PageControl1.ActivePageIndex = 1) and (trim(MEPrecoPromocao.Text)<>'') and (MEProduto2.Text<>'')then
    begin
      try
         begin
           if Trim(MEDt_Inicial.text)<>'' then
            Begin
              wvlr_Promocao:=StrToFloat(MePrecoPromocao.text);
              wDataI:=StrToDate(MeDt_Inicial.text);
            End;
           if Trim(MEDt_Final.text)<>'' then
            Begin
              //wvlr_Promocao1:=StrToFloat(MePrecoPromocao1.text);
              wDataF:=StrToDate(MeDt_Final.text);
            End;
           if Trim(MeComplemento.Text) <> '' then
             wComplemento := MeComplemento.Text;
         end;
      except
        raise Exception.Create('Valor do Preço Promoção, ou Data Inicial ou Data Final Inválido!');
      end;
      DMPrecos.QAtualizaPromocao.SetVariable('COD_PRODUTO',MeCodProduto2.Text);
      DMPrecos.QAtualizaPromocao.SetVariable('PRECO_PROMOCAO',wvlr_Promocao);
      DMPrecos.QAtualizaPromocao.SetVariable('PRECO_PROMOCAO1',wvlr_Promocao1);
      if wDataI<>0 then
         DMPrecos.QAtualizapromocao.SetVariable('DT_PRECO_PROM_INI',wDataI);
      if wDataF<>0 then
         DMPrecos.QAtualizapromocao.SetVariable('DT_PRECO_PROM_FIN',wDataF);
      if Trim(wComplemento) <> '' then
         DMPrecos.QAtualizapromocao.SetVariable('DESC_COMPLEMENTO_PROMOCAO',wComplemento);
      DMPrecos.QAtualizaPromocao.ExecSQL;
    end;
    DMOracle.DBCemapa.Commit;
    MessageDlg('Preço do Produto Atualizado.',mtInformation,[mbOk],0);
 //   if PageControl1.ActivePageIndex = 0 then
 //     MeCodProduto.SetFocus
 //   else
      MeCodProduto2.SetFocus;
  Except
    DMOracle.DBCemapa.RollBack;
  End;

  if (PageControl1.ActivePageIndex = 2) then
    begin
      try
         begin
           if ((Trim(MEDtINIClassePromo.text)<>'') or (Trim(MEDtFimClassePromo.text)<>'')) then
            Begin
              wDataI:=StrToDate(MEDtINIClassePromo.text);
              wDataF:=StrToDate(MEDtFimClassePromo.text);
            End
            else
              Raise Exception.Create('Informe as Datas!');

           if Trim(MeComplementoPromo.Text) <> '' then
             wComplemento := MeComplementoPromo.Text
           else
             Raise Exception.Create('Informe a Descrição!');

           if Trim(MePercDesconto.Text) <> '' then
              wpct_varejo := StrToFloat(MePercDesconto.Text)
           else
             Raise Exception.Create('Informe o percentual de desconto!');
         end;
      //end;
      DMPrecos.QProdutoClasseCons.Close;
      DMPrecos.QProdutoClasseCons.SetVariable('NUM_CLASSE', Trim(MeclassePromo.Text));
      DMPrecos.QProdutoClasseCons.SetVariable('NUM_SUBCLASSE', Trim(MeSubclassePromo.Text));
      DMPrecos.QProdutoClasseCons.Open;
      DMPrecos.QProdutoClasseCons.First;
      while not DMPrecos.QprodutoClasseCons.EOF do
      Begin
        DMPrecos.QAtualizaPromocao.SetVariable('COD_PRODUTO',DMPrecos.QProdutoClasseConsCOD_PRODUTO.Text);
        DMPrecos.QAtualizaPromocao.SetVariable('PRECO_PROMOCAO',(DMPrecos.QProdutoClasseConsVAL_VAREJO.Value -
                    ((DMPrecos.QProdutoClasseConsVAL_VAREJO.Value * wpct_varejo)/100)));
        DMPrecos.QAtualizaPromocao.SetVariable('PRECO_PROMOCAO1','0');
        if wDataI<>0 then
           DMPrecos.QAtualizapromocao.SetVariable('DT_PRECO_PROM_INI',wDataI);
        if wDataF<>0 then
           DMPrecos.QAtualizapromocao.SetVariable('DT_PRECO_PROM_FIN',wDataF);
        if Trim(wComplemento) <> '' then
           DMPrecos.QAtualizapromocao.SetVariable('DESC_COMPLEMENTO_PROMOCAO',wComplemento);
        DMPrecos.QAtualizaPromocao.ExecSQL;
        inc(wCont);
        DMPrecos.QProdutoClasseCons.Next;
      end;
    //end;
      DMOracle.DBCemapa.Commit;
      MessageDlg('Preço do Produto Atualizado.' + 'Total de registros '+ IntToStr(wCont),mtInformation,[mbOk],0)
 // end;
      Except
      DMOracle.DBCemapa.RollBack;
    End;
   end;
  // Limpa campos na tela. Apos atualização.
  MECodProduto.Clear;
  MEPercVarejo.Clear;
  MEPercAtacado.Clear;
  MEPrecoVarejo.Clear;
  MEPrecoFrete.Clear;
  MEPrecoAtacado.Clear;
  MEPrecoPromocao.Clear;
  MEPrecoPromocao1.Clear;
  MeCadastro.Clear;
End;

procedure TFPrecoCad.FormCreate(Sender: TObject);
begin
{  DMParamSistema.QParamSistema.Open;}
  LPrecoAtacMin.Caption:='Preço '+DMParamSistema.QParamSistemaInd_Preco.value;
  LPrecoVarMax.Caption:='Preço '+DMParamSistema.QParamSistemaInd_Preco2.value;
  LPercAtacMin.Caption:='Perc. '+DMParamSistema.QParamSistemaInd_Preco.value;
  LPercVarMax.Caption:='Perc. '+DMParamSistema.QParamSistemaInd_Preco2.value;
{  DMParamSistema.QParamSistema.Close;}


  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ARISTIDES' then
  begin
    RGAtualizarPor.ItemIndex := 1;
    Label3.Visible := false;
    MEClasse.Visible := false;
    label4.Visible := false;
    MESubClasse.Visible := false;
    Label9.Visible := false;
    MEDescClasse.Visible := false;
    BtClasse.Visible := false;
    Label13.Visible := false;
    MeCadastro.Visible := false;
    SbFornecedor.Visible := false;
    Label12.Visible := false;
    MePrecoFrete.Visible := false;
    Label14.Visible := false;
    MeDtVenctoPreco.Visible := false;
    GBPromocao.Visible := false;
    SBPrecoPromocao.Visible := false;
  end;
end;

procedure TFPrecoCad.RGAtualizarPorClick(Sender: TObject);
begin
  If RGAtualizarPor.ItemIndex=0 Then
    Begin                            //Por Percentual
      MEPrecoVarejo.ReadOnly:=True;
      MEPrecoAtacado.ReadOnly:=True;
      MEPrecoFrete.ReadOnly:=True;
      MEPrecoFrete.Text:='';
      MEPrecoVarejo.Text:='';
      MEPrecoAtacado.Text:='';
      MEPrecoVarejo.ParentColor:=True;
      MEPrecoAtacado.ParentColor:=True;
      MEPrecoFrete.ParentColor:=True;
      MEPercAtacado.ReadOnly:=False;
      MEPercVarejo.ReadOnly:=False;
      MEPercVarejo.Color:=clWindow;
      MEPercAtacado.Color:=clWindow;
      {MESubClasse.ReadOnly:=False;
      MEClasse.Color:=clWindow;
      MESubClasse.Color:=clWindow;}
      BtClasse.Enabled:=True;
    End
  Else
    Begin                             // Por Valor
      MEPrecoVarejo.ReadOnly:=False;
      MEPrecoAtacado.ReadOnly:=False;
      MEPrecoFrete.ReadOnly:=False;
      MEPrecoFrete.Color:=clWindow;
      MEPrecoVarejo.Color:=clWindow;
      MEPrecoAtacado.Color:=clWindow;
      MEPercAtacado.ReadOnly:=True;
      MEPercVarejo.ReadOnly:=True;
      MEPercVarejo.ParentColor:=True;
      MEPercAtacado.ParentColor:=True;
      MEPercVarejo.Text:='';
      MEPercAtacado.Text:='';
      {MEClasse.ReadOnly:=False;
      MEClasse.ReadOnly:=True;
      MESubClasse.ReadOnly:=True;
      MEClasse.ParentColor:=True;
      MESubClasse.ParentColor:=True;}
      BtClasse.Enabled:=False;
      MeDtVenctoPreco.Text := DateToStr(Date);
    End
end;

procedure TFPrecoCad.MECodProdutoChange(Sender: TObject);
begin
  if Trim(MECodProduto.text)<>'' then
    begin
      MEProduto.Text:=DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+MECodProduto.text);
      MEDescClasse.Text:='';
      MEClasse.Text:='';
      MESubClasse.text:='';
      if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ARISTIDES' then
        if RGAtualizarPor.ItemIndex = 1 then
          MEPrecoVarejo.Text := DMOracle.BuscaNome('SELECT VAL_VAREJO FROM TB_PRODUTO','COD_PRODUTO = ' + MECodProduto.text);
    end
  else
    begin
      MEProduto.Clear;
    end;
end;

procedure TFPrecoCad.SBPrecoPromocaoClick(Sender: TObject);
begin
  With DMPrecos do
  Begin
    QLimpaPromocao.Close;
    if MEProduto2.Text = '' then
    begin
      if MessageDlg('Se não for informado um produto, o sistema irá cancelar a promoção de todos. Deseja continuar mesmo assim?',
        mtConfirmation, [mbYes,mbNo],0) = mrNo then
        Abort;
    end
    else
      QLimpaPromocao.SetVariable('COD_PRODUTO', MECodProduto2.Text);
    QLimpaPromocao.Open;
    QLimpaPromocao.First;
    While Not QLimpaPromocao.Eof Do
    Begin
      DMPrecos.QAtualizaPromocao.SetVariable('COD_PRODUTO',QLimpaPromocaoCod_Produto.Value);
      DMPrecos.QAtualizaPromocao.SetVariable('PRECO_PROMOCAO',0);
      DMPrecos.QAtualizapromocao.SetVariable('DT_PRECO_PROM_INI',Null);
      DMPrecos.QAtualizapromocao.SetVariable('DT_PRECO_PROM_FIN',Null);
      DMPrecos.QAtualizapromocao.SetVariable('DESC_COMPLEMENTO_PROMOCAO',Null);
      If DMParamSistema.QParamSistemaCod_Empresa.Value = 'AB' Then
      Begin
        If QLimpaPromocaoQt_Quantidade.Value <= 0 Then
          DMPrecos.QAtualizaPromocao.ExecSQL;
      End
      Else
        DMPrecos.QAtualizaPromocao.ExecSQL;
      QLimpaPromocao.Next;
    End;
    QLimpaPromocao.Close;
    If DMOracle.DBCemapa.InTransaction Then
      DMOracle.DBCemapa.Commit;
    ShowMessage('Limpeza de Promoção Realizada Com Sucesso.')
  End;
end;

procedure TFPrecoCad.FormActivate(Sender: TObject);
begin
  If DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO' Then
  Begin
    MePrecoAtacado.Visible := False;
    MePercAtacado.Visible := False;
    LPrecoAtacMin.Visible := False;
    LPercAtacMin.Visible := False;
    Label12.Visible := False;
    MePrecoFrete.Visible := False;
  End;
   If DMParamSistema.CodEmpresa = 'NUTRIPET' Then
  Begin
    TabSheet1.TabVisible := False;
  end;
end;

procedure TFPrecoCad.SbFornecedorClick(Sender: TObject);
begin
  If FCadastroCons=Nil then
    FCadastroCons:=TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal=mrOk then
     MeCadastro.Text:=DMCadastro.QCadastroConsCod_Cadastro.Text;
end;

procedure TFPrecoCad.BtProduto2Click(Sender: TObject);
begin
  If FProdutoCons=Nil then
    FProdutoCons:=TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal=mrOk then
    Begin
      MECodProduto2.Text:=FloatToSTr(DMProduto.QProdutoConsCod_Produto.value);

    end;
end;

procedure TFPrecoCad.MECodProduto2Exit(Sender: TObject);
begin
  if Trim(MECodProduto2.text)<>'' then
    begin
      MEProduto2.Text:=DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+MECodProduto2.text);
    end
  else
  begin
    MEProduto2.Clear;
  end;
end;

procedure TFPrecoCad.PageControl1Change(Sender: TObject);
begin
  if PageControl1.ActivePageIndex = 0 then
    RGAtualizarPor.SetFocus;
  if PageControl1.ActivePageIndex = 1 then
     MECodProduto2.SetFocus;
end;

procedure TFPrecoCad.SBClassePromoConsClick(Sender: TObject);
begin
  If FClasseCons=Nil then
    FClasseCons:=TFClasseCons.Create(Application);
  If FClasseCons.ShowModal=mrOk then
  Begin
    MEClassePromo.Text:=FloatToSTr(DMClasse.QClasseConsNum_Classe.value);
    MESubClassePromo.text:=FloatToStr(DMClasse.QClasseConsNum_SubClasse.value);
    MEDescClassePromo.Text:=DMClasse.QClasseConsDesc_Classe.value;
  end;
end;

end.
