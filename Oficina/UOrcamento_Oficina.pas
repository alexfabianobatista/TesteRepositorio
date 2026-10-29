unit UOrcamento_Oficina;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, OracleNavigator, Grids, DBGrids, ActnList, Variants,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

type
  TFOFI0006 = class(TFTCadSimples)
    DSOrcamento_Oficina_Item: TDataSource;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    SBVendedorCons: TSpeedButton;
    DBEdit19: TDBEdit;
    SBCadastroCons: TSpeedButton;
    DBEdit6: TDBEdit;
    SBOSCons: TSpeedButton;
    Impressooramento1: TMenuItem;
    GBItens: TGroupBox;
    Label6: TLabel;
    Label9: TLabel;
    SBProdutoCons: TSpeedButton;
    Label7: TLabel;
    DBGrid1: TDBGrid;
    OracleNavigator1: TOracleNavigator;
    DBEdit7: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    Label8: TLabel;
    Label10: TLabel;
    DBMemo1: TDBMemo;
    DBMemo2: TDBMemo;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    CustoFornecedor1: TMenuItem;
    procedure SBVendedorConsClick(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure SBCadastroConsClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SBOSConsClick(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure SBProdutoConsClick(Sender: TObject);
    procedure DBEdit10Exit(Sender: TObject);
    procedure Impressooramento1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DSOrcamento_Oficina_ItemStateChange(Sender: TObject);
    procedure CustoFornecedor1Click(Sender: TObject);
    procedure DBEdit5Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FOFI0006: TFOFI0006;

implementation

uses UOficina_cl, UVendedorCons, UVendedor_cl, UCadastroCons, UCadastro_cl,
  UOSCons, UOracle_cl, UOrcamento_OficinaCons, UProdutoCons, UProduto_cl,
  URelatorio_cl, UROrcamento_Oficina, UOs_cl, UOficinaParam, URCustoFornecedor;

{$R *.DFM}

procedure TFOFI0006.SBVendedorConsClick(Sender: TObject);
begin
  inherited;
  if FVendedorCons = nil then
     FVendedorCons:= TFVendedorCons.Create(Application);
  if FVendedorCons.ShowModal = mrOk then
     DBEdit3.Text := FloatToStr(DMVendedor.QVendedorConsCOD_VENDEDOR.Value);
end;

procedure TFOFI0006.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  if DSPrimario.State in [dsInsert,dsEdit] then
  begin
    SBVendedorCons.Enabled:= True;
    SBCadastroCons.Enabled:= True;
    SBOSCons.Enabled:= True;
  end
  else
  begin
    SBVendedorCons.Enabled:= False;
    SBCadastroCons.Enabled:= False;
    SBOSCons.Enabled:= False;
  end;
end;

procedure TFOFI0006.SBCadastroConsClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
     FCadastroCons:= TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
     DBEdit4.Text:= FloatToStr(DMCadastro.QCadastroConsCOD_CADASTRO.Value);
end;

procedure TFOFI0006.FormActivate(Sender: TObject);
begin
  inherited;
  with DMOficina do
  begin
    QOrcamento_Oficina.Close;
    QOrcamento_Oficina_Item.Close;
    QOrcamento_Oficina.Open;
    QOrcamento_Oficina_Item.Open;
  end;
end;

procedure TFOFI0006.SBOSConsClick(Sender: TObject);
begin
  inherited;
  if FOsCons = nil then
     FOsCons := TFOsCons.Create(Application);
  if FOsCons.ShowModal = mrOk then
     DMOficina.QOrcamento_OficinaNUM_OS.Value := DMOs.QOSConsNUM_OS.Value;
  DBEdit5Exit(Self);
end;

procedure TFOFI0006.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FOFI0005 = nil then
     FOFI0005:= TFOFI0005.Create(Application);
  if FOFI0005.ShowModal = mrOk then
  begin
    with DMOficina do
    begin
      QOrcamento_Oficina.Close;
      QOrcamento_Oficina_Item.Close;
      QOrcamento_Oficina.SetVariable('PK',QOrcamento_OficinaConsNUM_ORCAMENTO.Value);
      QOrcamento_Oficina_Item.SetVariable('num_orcamento',QOrcamento_OficinaConsNUM_ORCAMENTO.Value);
      QOrcamento_Oficina.Open;
      QOrcamento_Oficina_Item.Open;

      QOrcamento_OficinaCons.Close;
    end;
  end;
end;

procedure TFOFI0006.SBProdutoConsClick(Sender: TObject);
begin
  inherited;
  if FProdutoCons = nil then
     FProdutoCons := TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = mrOk then
     DBEdit10.Text := DMProduto.QProdutoConsNUM_FABRICANTE.Value;
end;

procedure TFOFI0006.DBEdit10Exit(Sender: TObject);
var mValorUnitario: String;
begin
  inherited;
  if Trim(DBEdit10.Text) <> '' then
  begin
    with DMOficina do
    begin
      QOrcamento_Oficina_Itemdesc_produto.Value:= DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','NUM_FABRICANTE = '+chr(39)+DBEdit10.Text+chr(39));
      mValorUnitario:= DMOracle.BuscaNome('SELECT VAL_VAREJO FROM TB_PRODUTO','NUM_FABRICANTE = '+chr(39)+DBEdit10.Text+chr(39));
      if Trim(mValorUnitario) <> '' then
         QOrcamento_Oficina_ItemVAL_UNITARIO.Value := StrToFloat(mValorUnitario);
    end;
  end;
end;

procedure TFOFI0006.Impressooramento1Click(Sender: TObject);
begin
  inherited;
  if Trim(DBEdit1.Text) = '' then
  begin
    MessageDlg('Primeiro selecione orçamento na tela!',mtInformation,[mbOk],0);
    Exit;
  end
  else
  begin
    with dmoficina_relatorio do
    begin
      QROrcamento_Oficina.Close;
      QROrcamento_Oficina.SetVariable('num_orcamento',DBEdit1.Text);
      QROrcamento_Oficina.Open;
      if FROrcamento_Oficina = nil then
         FROrcamento_Oficina:= TFROrcamento_Oficina.Create(Application);

       FROrcamento_Oficina.QRLabel3.Caption:= 'ORÇAMENTO: '+DBEdit1.Text;
       FROrcamento_Oficina.QRLabel4.Caption:= 'EMISSÃO  : '+DBEdit2.Text;
       FROrcamento_Oficina.QRLabel5.Caption:= 'CADASTRO : '+Trim(DBEdit4.Text)+'-'+DBEdit6.Text;
      FROrcamento_Oficina.QRLabel15.Caption:= 'Nr. O.S  : '+TRIM(DBEdit5.Text);
      FROrcamento_Oficina.QRPrimario.Preview;
    end;
  end;
end;

procedure TFOFI0006.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMOficina.QOrcamento_Oficina.Close;
  Action := CaFree;
  FOFI0006 := Nil;
end;

procedure TFOFI0006.DSOrcamento_Oficina_ItemStateChange(Sender: TObject);
begin
  inherited;
  SBProdutoCons.Enabled := DSOrcamento_Oficina_Item.State in [dsInsert,dsEdit];
end;

procedure TFOFI0006.CustoFornecedor1Click(Sender: TObject);
begin
  inherited;
  if Trim(DBEdit1.Text) = '' then
  begin
    MessageDlg('Primeiro selecione orçamento na tela!',mtInformation,[mbOk],0);
    Exit;
  end
  else
  begin
    with dmoficina_relatorio do
    begin
      QRCustoFornecedor.Close;
      QRCustoFornecedor.SetVariable('COD_FILIAL',null);
      QRCustoFornecedor.SetVariable('LOTE_TIPO',null);
      QRCustoFornecedor.SetVariable('NUM_OS',DBEdit5.Text);

      QRCustoFornecedor.Open;
      if FRCustoFornecedor = nil then
         FRCustoFornecedor := TFRCustoFornecedor.Create(Application);

      //FROrcamento_Oficina.QRLabel3.Caption:= 'ORÇAMENTO: '+DBEdit1.Text;
      //FROrcamento_Oficina.QRLabel4.Caption:= 'EMISSÃO  : '+DBEdit2.Text;
      //FROrcamento_Oficina.QRLabel5.Caption:= 'CADASTRO : '+Trim(DBEdit4.Text)+'-'+DBEdit6.Text;
      FRCustoFornecedor.QRPrimario.Preview;
    end;
  end;

    {if FOficinaParam = nil then
      FOficinaParam := TFOficinaParam.Create(Application);
    FOficinaParam.PGRelatorio.Pages[24].TabVisible := True;

    if FOficinaParam.ShowModal = mrOk then
    begin
      with DMOficina_Relatorio do
      begin
        QRCustoFornecedor.Close;
        if Trim(FOficinaParam.Fm24Filial.MeFilial.Text) = '' then
          QRCustoFornecedor.SetVariable('COD_FILIAL', Null)
        else
          QRCustoFornecedor.SetVariable('COD_FILIAL', FOficinaParam.Fm24Filial.MeFilial.Text);

        if Trim(FOficinaParam.Fm24Lote.MeLote.Text) = '' then
          QRCustoFornecedor.SetVariable('LOTE_TIPO', Null)
        else
          QRCustoFornecedor.SetVariable('LOTE_TIPO', FOficinaParam.Fm24Lote.MeLote.Text);

        if Trim(FOficinaParam.ME24NumOS.Text) = '' then
          QRCustoFornecedor.SetVariable('NUM_OS', Null)
        else
          QRCustoFornecedor.SetVariable('NUM_OS', FOficinaParam.ME24NumOS.Text);

        QRCustoFornecedor.Open;

        if FRCustoFornecedor = nil then
          FRCustoFornecedor := TFRCustoFornecedor.Create(Application);
        if FOficinaParam.RGPreview.ItemIndex = 0 then
          FRCustoFornecedor.QRPrimario.Preview
        else
          FRCustoFornecedor.QRPrimario.Print;
      end;
    end;
  end;}

end;

procedure TFOFI0006.DBEdit5Exit(Sender: TObject);
begin
  inherited;
  If MessageDlg('Deseja importar produtos da ordem de serviço?', MtConfirmation, [mbYes, mbNo], 0) = MrYes then
   Begin
     If Not(DSPrimario.State in [DsInsert,DsEdit]) Then
        Raise exception.Create('Orçamento deve estar em modo de Inserção/Alteração');
     If DMOficina.QOrcamento_OficinaNum_OS.Text <> '' Then
      Begin
        DMOs.QOSCad.Close;
        DMOs.QOSCad.SetVariable('Pk',DMOficina.QOrcamento_OficinaNum_OS.Value);
        DMOs.QOSCad.Open;
        If Not(DMOs.QOSCad.Eof) Then
         Begin
           DMOficina.QOrcamento_OficinaCod_Cadastro.Value := DMOs.QOSCadCod_Cadastro.Value;
           DMOficina.QOrcamento_OficinaCod_Vendedor.Value := DMOs.QOSCadCod_Vendedor.Value;
         End;
        DMOs.QOSCad.Close;
        With DMOficina do
         Begin
           QRequisicaoCons.Close;
           QRequisicaoCons.SetVariable('Num_Os',DMOficina.QOrcamento_OficinaNum_OS.Value);
           QRequisicaoCons.SetVariable('Cod_Filial',Null);
           QRequisicaoCons.SetVariable('Ind_Situacao',Null);
           QRequisicaoCons.Open;
           QRequisicaoItensCons.Close;
           QRequisicaoItensCons.SetVariable('Num_Os',DMOficina.QOrcamento_OficinaNum_OS.Value);
           QRequisicaoItensCons.SetVariable('Num_Fabricante',Null);
           QRequisicaoItensCons.SetVariable('Cod_Filial',Null);
//           QRequisicaoItensCons.SetVariable('Num_Requisicao',Null);
           QRequisicaoItensCons.Open;
           QRequisicaoItensCons.First;
           While Not(QRequisicaoItensCons.Eof) Do
           Begin
             QOrcamento_Oficina_Item.Insert;
             QOrcamento_Oficina_ItemNUM_FABRICANTE.Value := QRequisicaoItensConsNum_Fabricante.Value;
             QOrcamento_Oficina_ItemQT_QUANTIDADE.Text := QRequisicaoItensConsQt_Quantidade.Text;
             QOrcamento_Oficina_ItemVAL_UNITARIO.Value := QRequisicaoItensConsVal_Unitario.Value;
             QOrcamento_Oficina_Itemdesc_produto.Value:= DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','NUM_FABRICANTE = '+QuotedStr(DBEdit10.Text));
             QOrcamento_Oficina_Item.Post;
             QRequisicaoItensCons.Next;
           End;
           QRequisicaoItensCons.Close;
           QRequisicaoCons.Close;
         End;
      End;
   End;
End;

end.
