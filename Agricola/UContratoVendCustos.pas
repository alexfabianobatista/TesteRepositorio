unit UContratoVendCustos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, DBDirceu, Variants, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, ActnList;

type
  TFContratoVendCustos = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    BtFilial: TSpeedButton;
    DbFilial: TDBDirceu;
    BtCadastro: TSpeedButton;
    DbCadastro: TDBDirceu;
    BTGeraMov: TSpeedButton;
    BTExcluiMov: TSpeedButton;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    BtProduto: TSpeedButton;
    DBProduto: TDBDirceu;
    Label12: TLabel;
    DBEdit12: TDBEdit;
    BtCadastroParceiro: TSpeedButton;
    DBDirceu1: TDBDirceu;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    CustosdeControledeVenda1: TMenuItem;
    procedure BtFilialClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBConsultaClick(Sender: TObject);
    procedure DSPrimarioDataChange(Sender: TObject; Field: TField);
    procedure BtCadastroClick(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure BTGeraMovClick(Sender: TObject);
    procedure ChamaGeraMov(Origem,Docto:String);
    procedure BtProdutoClick(Sender: TObject);
    procedure BTExcluiMovClick(Sender: TObject);
    procedure BtCadastroParceiroClick(Sender: TObject);
    procedure CustosdeControledeVenda1Click(Sender: TObject);
    procedure DBEdit4Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FContratoVendCustos: TFContratoVendCustos;

implementation

uses UContrato_Vend_Cl, UFilialCons, UContratoVenda_Cons, UFilial_cl,
  UContratoVendCustoCons, UCadastroCons, UCadastro_cl,
  UOracle_cl, UGeraCVenda, UProdutoCons, UProduto_cl, Ucontrato_cl,
  UExcluiMovVend_Custos, UUsuario_cl, UContratoVendCustosParam,
  URContrato_Vend_Custos;

{$R *.DFM}

procedure TFContratoVendCustos.BtFilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.Showmodal = mrOk then
    DMContrato_Vend.QContrato_Vend_CustosCod_Filial.Value := DMFilial.QFilialConsCod_Filial.Value;

end;

procedure TFContratoVendCustos.FormActivate(Sender: TObject);
begin
  inherited;
  DMContrato_Vend.QContrato_Vend_Custos.Open;
end;

procedure TFContratoVendCustos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMContrato_Vend.QContrato_Vend_Custos.Close;
  Action := CaFree;
  FContratoVendCustos := Nil;
end;

procedure TFContratoVendCustos.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FContratoVendCustoCons = Nil then
    FContratoVendCustoCons := TFContratoVendCustoCons.Create(Application);
  if FContratoVendCustoCons.ShowModal = mrOk then
    with DMContrato_Vend do
      begin
        QContrato_Vend_Custos.Close;
        QContrato_Vend_Custos.SetVariable('PK',QContrato_Vend_Custos_ConsCod_Contrato_Vend_Custos.Value);
        QContrato_Vend_Custos.Open;
        QContrato_Vend_Custos_Cons.Close;
      end;

end;

procedure TFContratoVendCustos.DSPrimarioDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  If DsPrimario.State in [DsInsert,DsEdit] Then
   Begin
     BtFilial.Enabled := True;
     BtCadastro.Enabled := True;
     BtProduto.Enabled := True;
     BtCadastroParceiro.Enabled := True;
   End
  Else
   Begin
     BtFilial.Enabled := False;
     BtCadastro.Enabled := False;
     BtProduto.Enabled := False;
     BtCadastroParceiro.Enabled := False;
   End;
end;

procedure TFContratoVendCustos.BtCadastroClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
     DMContrato_vend.QContrato_Vend_CustosCOD_CADASTRO.Value := DMCadastro.QCadastroConsCod_Cadastro.Value;
end;

procedure TFContratoVendCustos.SBConfirmarClick(Sender: TObject);
begin
  DmUsuario.Checar_Filial_Usuario( Trim(DMContrato_Vend.QContrato_Vend_CustosCOD_FILIAL.Text),'AGRICOLA');
  DMContrato_Vend.QContrato_Vend_CustosQTDE_SALDO.Value := DMContrato_Vend.QContrato_Vend_CustosQT_Quantidade.Value;
  inherited;
  Try
    DMOracle.DBCemapa.Commit;
  except
    DMOracle.DBCemapa.RollBack;
    Raise Exception.Create('Erro Valores Inconsistentes.');
  end;
end;

procedure TFContratoVendCustos.BTGeraMovClick(Sender: TObject);
begin
  inherited;
  DmUsuario.Checar_Filial_Usuario( Trim(DMContrato_Vend.QContrato_Vend_CustosCOD_FILIAL.Text),'AGRICOLA');
  ChamaGeraMov('Vend','CUS');  // CUSTOS
end;

procedure TFContratoVendCustos.ChamaGeraMov(Origem,Docto: String);
var
  SaldoAplicar, Valor :Real;
  wClasse,wSubClasse,wCodClasse,wContinua : Integer;
begin
  inherited;
  with DMContrato_Vend do
    begin
      wContinua := 1;
      If QContrato_Vend_CustosQTDE_SALDO.Value = 0 then
        If MessageDlg('Não há mais saldo a aplicar neste lançamento. Continuar?',mtConfirmation, [mbYes, mbNo], 0) = mrNo then
           wContinua := 0;
      If wContinua = 1 Then
       Begin
          SaldoAplicar :=QContrato_Vend_CustosQTDE_SALDO.Value;
          SaldoAplicar :=Trunc(SaldoAplicar*100)/100;
//        Embalagem:=StrToFloat(DMOracle.Buscanome('SELECT NUM_EMBALAGEM FROM TB_PRODUTO','COD_PRODUTO = '+QContrato_Vend_CustosCod_produto.text));
          If QContrato_Vend_CustosQT_QUANTIDADE.Value <> 0 Then
             Valor := QContrato_Vend_CustosVAL_LANCAMENTO.Value / QContrato_Vend_CustosQT_QUANTIDADE.Value * SaldoAplicar
          Else
             Valor := QContrato_Vend_CustosVAL_LANCAMENTO.Value;
          wCodClasse:=StrToInt(DMOracle.BuscaNome('SELECT COD_CLASSE FROM TB_PRODUTO','COD_PRODUTO = '+QContrato_Vend_CustosCod_produto.text));
          wClasse:=StrToInt(DMOracle.BuscaNome('SELECT NUM_CLASSE FROM TB_CLASSE','COD_CLASSE = '+FloatToStr(wCodClasse)));
          wSubClasse:=StrToInt(DMOracle.BuscaNome('SELECT NUM_SUBCLASSE FROM TB_CLASSE','COD_CLASSE = '+FloatToStr(wCodClasse)));
          DMContrato.MontaSql(wClasse,wSubClasse,0,2,'','','','','','','',4);
          If DMContrato.QContrato_VendConsCOD_CONTRATO_VEND.Value <> 0 then
            begin
              If FGeraMovCVenda = nil then
                FGeraMovCVenda := TFGeraMovCVenda.Create(Application);
              If not(DMOracle.DBCemapa.inTransaction) then
                DMOracle.DBCemapa.StartTransaction;
              FGeraMovCVenda.LQuantidade.caption:=FormatFloat('#,##0',SaldoAplicar);
              FGeraMovCVenda.LValor.caption:=FormatFloat('#,##0.00',Valor);
              FGeraMovCVenda.pValor:=Valor;
              FGeraMovCVenda.pQtde:=SaldoAplicar;
              FGeraMovCVenda.pOrigem:=Origem;
              FGeraMovCVenda.pDocumento := Docto;
              FGeraMovCVenda.MeBaixa.Text:=FloatToStr(SaldoAplicar);
              FGeraMovCVenda.ShowModal;
            End
          Else
            ShowMessage('Não existem Contratos de Venda Abertos para este Produto e Filial');
       End;
      DMContrato.QContratoMovVend_Mov_Ant.Close;
      DMContrato.QContrato_VendCons.Close;
    end;
 end;
procedure TFContratoVendCustos.BtProdutoClick(Sender: TObject);
begin
  inherited;
  if FProdutoCons = nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = mrOk then
     DMContrato_vend.QContrato_Vend_CustosCod_Produto.Value := Trunc(DMProduto.QProdutoConsCod_Produto.Value);

end;

procedure TFContratoVendCustos.BTExcluiMovClick(Sender: TObject);
begin
  inherited;
  DmUsuario.Checar_Filial_Usuario( Trim(DMContrato_Vend.QContrato_Vend_CustosCOD_FILIAL.Text),'AGRICOLA');  
  if FExcluiMovVend_Custos=nil then
    FExcluiMovVend_Custos := TFExcluiMovVend_Custos.Create(Application);
  FExcluiMovVend_Custos.ShowModal;
end;

procedure TFContratoVendCustos.BtCadastroParceiroClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
     DMContrato_vend.QContrato_Vend_CustosCOD_CADASTRO_PARCEIRO.Value := DMCadastro.QCadastroConsCod_Cadastro.Value;

end;

procedure TFContratoVendCustos.CustosdeControledeVenda1Click(
  Sender: TObject);
begin
  inherited;
  if FContratoVendCustosParam = Nil then
    FContratoVendCustosParam := TFContratoVendCustosParam.Create(Application);
  FContratoVendCustosParam.PGRelatorio.Pages[0].TabVisible :=True;
  if FContratoVendCustosParam.ShowModal =  mrOk then
  begin
    with DMContrato_Vend do
    begin
      QRContrato_Vend_Custos.Close;

      //Frames-----------------
      if Trim(FContratoVendCustosParam.FmFilial1.MeFilial.Text) <> '' then
        QRContrato_Vend_Custos.SetVariable('COD_FILIAL', StrToInt(Trim(FContratoVendCustosParam.FmFilial1.MeFilial.Text)))
      else
        QRContrato_Vend_Custos.SetVariable('COD_FILIAL', Null);

      if Trim(FContratoVendCustosParam.FmProduto1.MeProduto.Text) <> '' then
        QRContrato_Vend_Custos.SetVariable('COD_PRODUTO', StrToInt(Trim(FContratoVendCustosParam.FmProduto1.MeProduto.Text)))
      else
        QRContrato_Vend_Custos.SetVariable('COD_PRODUTO', Null);
      //----------------------
      if Trim(FContratoVendCustosParam.ME1Data_I.Text) = '' then
        Raise Exception.Create('Deve-se fornecer uma Data Inicio ao Relatório');
      QRContrato_Vend_Custos.SetVariable('DATA_I',FContratoVendCustosParam.ME1Data_I.Text);

      if Trim(FContratoVendCustosParam.ME1Data_F.Text) = '' then
      begin
        QRContrato_Vend_Custos.SetVariable('DATA_F', date);
        FContratoVendCustosParam.ME1Data_F.Text := DateToStr(date);
      end
      else
        QRContrato_Vend_Custos.SetVariable('DATA_F',FContratoVendCustosParam.ME1Data_F.Text);

      QRContrato_Vend_Custos.SQL[QRContrato_Vend_Custos.SQL.Count-1] := '';
      Case FContratoVendCustosParam.Rg1Opcao.ItemIndex of
        0 : QRContrato_Vend_Custos.SQL.Add(' And Qtde_Saldo = 0');
        1 : QRContrato_Vend_Custos.SQL.Add(' And Qtde_Saldo <> 0');
      End;

      QRContrato_Vend_Custos.Open;

      If FRContrato_Vend_Custos = Nil then
        FRContrato_Vend_Custos := TFRContrato_Vend_Custos.Create(Application);

      FRContrato_Vend_Custos.QrlTitulo.Caption := 'Relação de Movimentação de Custos de Controle de Venda';
      FRContrato_Vend_Custos.QrlFilial.Caption := QRContrato_Vend_CustosDESC_FILIAL.Text;
      FRContrato_Vend_Custos.QRLPeriodo.Caption := 'De '   + Trim(FContratoVendCustosParam.Me1Data_I.Text) +
                                                   ' Até ' + Trim(FContratoVendCustosParam.Me1Data_F.Text);

      If FContratoVendCustosParam.RGPreview.ItemIndex = 0 then
        FRContrato_Vend_Custos.QRPrimario.Preview
      else
        FRContrato_Vend_Custos.QRPrimario.Print;

      QRContrato_Vend_Custos.Close;
    end;
  end;
end;

procedure TFContratoVendCustos.DBEdit4Exit(Sender: TObject);
begin
  inherited;
  DMOracle.ValidaFilial(DBEdit4.Text);
end;

end.
