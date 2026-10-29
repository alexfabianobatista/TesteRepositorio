unit UCompraProdutoCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, Grids, DBGrids, variants, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, ActnList;

type
  TFCompraProdutoCad = class(TFTCadSimples)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    BtFilial: TSpeedButton;
    BtFornecedor: TSpeedButton;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    DBEdit7: TDBEdit;
    Label6: TLabel;
    DBEdit8: TDBEdit;
    Label7: TLabel;
    DBEdit9: TDBEdit;
    Label8: TLabel;
    DBEdit10: TDBEdit;
    Label9: TLabel;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    Label11: TLabel;
    DBEdit13: TDBEdit;
    SBProdutoSeguranca: TSpeedButton;
    DBNavigator1: TDBNavigator;
    DBGrid1: TDBGrid;
    Operaes1: TMenuItem;
    ConfirmarCompra1: TMenuItem;
    CancelarCompra1: TMenuItem;
    DBText1: TDBText;
    DBEdit14: TDBEdit;
    Label10: TLabel;
    DBEdit15: TDBEdit;
    Label12: TLabel;
    DBEdit16: TDBEdit;
    Label13: TLabel;
    SBCodNotaCab: TSpeedButton;
    RelaodeNotas1: TMenuItem;
    Label14: TLabel;
    DBEdit17: TDBEdit;
    SBCaractProduto: TSpeedButton;
    DBEdit18: TDBEdit;
    DSItem: TDataSource;
    A1: TMenuItem;
    PosioCompra1: TMenuItem;
    procedure BtFilialClick(Sender: TObject);
    procedure BtFornecedorClick(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBProdutoSegurancaClick(Sender: TObject);
    procedure ConfirmarCompra1Click(Sender: TObject);
    procedure CancelarCompra1Click(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure SBAlterarClick(Sender: TObject);
    procedure SBCancelarClick(Sender: TObject);
    procedure SBCodNotaCabClick(Sender: TObject);
    procedure RelaodeNotas1Click(Sender: TObject);
    procedure SBCaractProdutoClick(Sender: TObject);
    procedure DBEdit16Exit(Sender: TObject);
    procedure DSItemStateChange(Sender: TObject);
    procedure A1Click(Sender: TObject);
    procedure SBHelpClick(Sender: TObject);
    procedure PosioCompra1Click(Sender: TObject);
    procedure DSPrimarioDataChange(Sender: TObject; Field: TField);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCompraProdutoCad: TFCompraProdutoCad;

implementation

uses UProdutoSeguranca_cl, UFilialCons, UFFuncionarioCons, UFilial_cl,
  UFuncionario_cl, UProdutoSegurancaCons, UCompraProdutoCons,
  UNotaEntrada_cl, UNotaEntradaCons, UOracle_cl, UCadastroCons,
  UCadastro_cl, USegurancaParam, UEstoqueSeguranca_cl, URMovEstoqueSeg,
  UCompraSeguranca_cl, URNotasRelacao, UCaracteristicaProdutoCons,
  UCaracteristicaProduto_cl, URPosicaoCompra;

{$R *.DFM}

procedure TFCompraProdutoCad.BtFilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
    DMCompraSeguranca.QCompraEquipCabCod_Filial.Value:= DMFilial.QFilialConsCod_Filial.Value;
end;

procedure TFCompraProdutoCad.BtFornecedorClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
    DMCompraSeguranca.QCompraEquipCabCod_Cadastro.Value:= DMCadastro.QCadastroConsCod_Cadastro.Value;
end;

procedure TFCompraProdutoCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  if DSPrimario.State in [DsEdit,DsInsert] then
  begin
    ConfirmarCompra1.Enabled:=False;
    CancelarCompra1.Enabled:=False;
  end
  else
  begin
    if DMCompraSeguranca.QCompraEquipCabIND_SITUACAO.Value = 'DIGITADA' then
    begin
      ConfirmarCompra1.Enabled:=True;
      CancelarCompra1.Enabled:=False;
    end
    else if DMCompraSeguranca.QCompraEquipCabIND_SITUACAO.Value = 'CONFIRMADA' then
    begin
      ConfirmarCompra1.Enabled:=False;
      CancelarCompra1.Enabled:=True;
    end;
  end;
//  BtFornecedor.Enabled:=SBConfirmar.Enabled;
  SBCodNotaCab.Enabled:=SBConfirmar.Enabled;
//  BTFilial.Enabled:=SBConfirmar.Enabled;
end;

procedure TFCompraProdutoCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMCompraSeguranca.QCompraEquipCab.open;
  DMCompraSeguranca.QCompraEquipItem.open;
end;

procedure TFCompraProdutoCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMCompraSeguranca.QCompraEquipCab.Close;
  DMCompraSeguranca.QCompraEquipItem.Close;
end;

procedure TFCompraProdutoCad.SBProdutoSegurancaClick(Sender: TObject);
begin
  inherited;
  if FProdutoSegurancaCons = nil then
    FProdutoSegurancaCons := TFProdutoSegurancaCons.Create(Application);
  if FProdutoSegurancaCons.showModal = mrOk then
    DMCompraSeguranca.QCompraEquipItemCOD_PRODUTO_SEGURANCA.Text := DMProdutoSeguranca.QProdutoSegurancaConsCOD_PRODUTO_SEGURANCA.Text;
end;

procedure TFCompraProdutoCad.ConfirmarCompra1Click(Sender: TObject);
begin
  inherited;
  with DMCompraSeguranca do
  begin
    if QCompraEquipCabIND_SITUACAO.Value = 'DIGITADA' then
    begin
      try
//        if not DMOracle.DBCemapa.InTransaction then
//          DMOracle.DBCemapa.StartTransaction;
        QCompraEquipItem.First;
        while not QCompraEquipItem.Eof do
        begin
          DMEstoqueSeguranca.AtualizaEstoqueSeguranca(QCompraEquipCabCOD_FILIAL.Value,QCompraEquipItemCOD_PRODUTO_SEGURANCA.Value,
                                                      QCompraEquipItemCOD_CARACTERISTICA_PRODUTO.Value,QCompraEquipItemQT_QUANTIDADE.Value,
                                                      QCompraEquipItemVAL_ITEM.Value,'+');
          QCompraEquipItem.Next;
        end;
        QCompraEquipCab.Edit;
        QCompraEquipCabIND_SITUACAO.Value := 'CONFIRMADA';
        QCompraEquipCab.Post;
  //      DMOracle.DBCemapa.Commit;
      except
    //    DMOracle.DBCemapa.Rollback;
        Raise;
      end;
    end
    else
      Raise Exception.Create('Esta compra já está confirmada!');
  end;
end;

procedure TFCompraProdutoCad.CancelarCompra1Click(Sender: TObject);
begin
  inherited;
  with DMCompraSeguranca do
  begin
    if QCompraEquipCabIND_SITUACAO.Value = 'CONFIRMADA' then
    begin
      QCompraEquipItem.First;
      while not QCompraEquipItem.Eof do
      begin
        DMEstoqueSeguranca.AtualizaEstoqueSeguranca(QCompraEquipCabCOD_FILIAL.Value,QCompraEquipItemCOD_PRODUTO_SEGURANCA.Value,
                                                    QCompraEquipItemCOD_CARACTERISTICA_PRODUTO.Value,QCompraEquipItemQT_QUANTIDADE.Value,
                                                    QCompraEquipItemVAL_ITEM.Value,'-');
        QCompraEquipItem.Next;
      end;
      QCompraEquipCab.Edit;
      QCompraEquipCabIND_SITUACAO.Value := 'DIGITADA';
      QCompraEquipCab.Post;
    end
    else
      Raise Exception.Create('Esta compra não está confirmada!');
  end;
end;

procedure TFCompraProdutoCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FCompraProdutoCons = nil then
    FCompraProdutoCons:=TFCompraProdutoCons.Create(Application);
  if FCompraProdutoCons.showModal = mrOk then
  begin
    with DMCompraSeguranca do
    begin
      QCompraEquipCab.Close;
      QCompraEquipCab.SetVariable('PK',QCompraEquipConsCOD_COMPRA_EQUIPAMENTO_CAB.Value);
      QCompraEquipCab.Open;
    end;
  end;
end;

procedure TFCompraProdutoCad.SBAlterarClick(Sender: TObject);
begin
  inherited;
  if DMCompraSeguranca.QCompraEquipCabIND_SITUACAO.Value = 'CONFIRMADA' then
  begin
    DMCompraSeguranca.QCompraEquipCab.cancel;
    Raise Exception.Create('Não é possível fazer alteração - Compra Confirmada');
  end;
end;

procedure TFCompraProdutoCad.SBCancelarClick(Sender: TObject);
begin
  inherited;
  DSPrimarioStateChange(Self);
end;

procedure TFCompraProdutoCad.SBCodNotaCabClick(Sender: TObject);
begin
  inherited;
  if FNotaEntradaCons = Nil then
    FNotaEntradaCons := TFNotaEntradaCons.Create(Application);
  if FNotaEntradaCons.ShowModal = mrOk then
    DMCompraSeguranca.QCompraEquipCabCod_Nota_Cab.Value := DMNotaEntrada.QNotaEntradaConsCod_Nota_Cab.Value;
  DBEdit16Exit(Self);    
end;

procedure TFCompraProdutoCad.RelaodeNotas1Click(Sender: TObject);
begin
  inherited;
  If FSegurancaParam = Nil then
    FSegurancaParam := TFSegurancaParam.Create(Application);
  FSegurancaParam.PGRelatorio.Pages[4].TabVisible := True;
  If FSegurancaParam.ShowModal = mrOk then
  With DMCompraSeguranca do
  Begin
    QRNotasRelacao.Close;
    if Trim(FSegurancaParam.ME5DtInicial.Text) = '' then
      Raise Exception.Create('A Data Inicial deve ser Informada');
    if Trim(FSegurancaParam.ME5DtFinal.Text) = '' then
      FSegurancaParam.ME5DtFinal.Text := DateToStr(date);
    QRNotasRelacao.SetVariable('DT_INICIAL',FSegurancaParam.ME5DtInicial.Text);
    QRNotasRelacao.SetVariable('DT_FINAL',FSegurancaParam.ME5DtFinal.Text);
    if(trim(FSegurancaParam.ME5Filial.Text)<> '') then
      QRNotasRelacao.SetVariable('COD_FILIAL',StrToInt(trim(FSegurancaParam.ME5Filial.Text)))
    else
      QRNotasRelacao.SetVariable('COD_FILIAL',null);
    if trim(FSegurancaParam.ME5Fornecedor.Text) <> '' then
      QRNotasRelacao.SetVariable('COD_CADASTRO',StrToInt(trim(FSegurancaParam.ME5Fornecedor.Text)))
    else
      QRNotasRelacao.SetVariable('COD_CADASTRO',null);
    QRNotasRelacao.Open;
    If FRNotasRelacao = Nil then
      FRNotasRelacao := TFRNotasRelacao.Create(Application);
    FRNotasRelacao.QRLFilial.Caption :=  'Filial : '+Trim(FSegurancaParam.ED5Filial.Text);
    FRNotasRelacao.QRLPeriodo.Caption := 'Período: De '+Trim(FSegurancaParam.ME5DtInicial.Text)+
                                         ' Até '+Trim(FSegurancaParam.ME5DtFinal.Text);
    If FSegurancaParam.RGPreview.ItemIndex = 0 then
      FRNotasRelacao.QRPrimario.Preview
    else
      FRNotasRelacao.QRPrimario.print;
    QRNotasRelacao.close;
  End;
end;

procedure TFCompraProdutoCad.SBCaractProdutoClick(Sender: TObject);
begin
  inherited;
  if FCaracteristicaProdutoCons = nil then
    FCaracteristicaProdutoCons := TFCaracteristicaProdutoCons.Create(Application);
  if FCaracteristicaProdutoCons.showModal = mrOk then
    DMCompraSeguranca.QCompraEquipItemCOD_CARACTERISTICA_PRODUTO.Text := DMCaracteristicaProduto.QCaracteristicaProdutoConsCOD_CARACTERISTICA_PRODUTO.Text;
end;

procedure TFCompraProdutoCad.DBEdit16Exit(Sender: TObject);
begin
  inherited;
  with DMCompraSeguranca do
  begin
    if Trim(QCompraEquipCabCod_Nota_Cab.Text) <> '' then
    begin
      QCompraEquipCabNum_Nota.Text := DMOracle.BuscaNome('SELECT NUM_NOTA FROM TB_NOTA_CAB',
                                                         'COD_NOTA_CAB = '+QCompraEquipCabCod_Nota_Cab.Text);
      QCompraEquipCabDt_Emissao.Text := DMOracle.BuscaNome('SELECT DT_EMISSAO FROM TB_NOTA_CAB',
                                                           'COD_NOTA_CAB = '+QCompraEquipCabCod_Nota_Cab.Text);
      QCompraEquipCabCod_Filial.Text := DMOracle.BuscaNome('SELECT COD_FILIAL FROM TB_NOTA_CAB',
                                                         'COD_NOTA_CAB = '+QCompraEquipCabCod_Nota_Cab.Text);
      QCompraEquipCabCod_Cadastro.Text := DMOracle.BuscaNome('SELECT COD_CADASTRO FROM TB_NOTA_CAB',
                                                           'COD_NOTA_CAB = '+QCompraEquipCabCod_Nota_Cab.Text);
    end
    else
    begin
      QCompraEquipCabNum_Nota.Text := '';
      QCompraEquipCabDt_Emissao.Text := '';
      QCompraEquipCabCod_Filial.Text := '';
      QCompraEquipCabCod_Cadastro.Text := '';
    end;
  end;
end;

procedure TFCompraProdutoCad.DSItemStateChange(Sender: TObject);
begin
  inherited;
  if DSItem.State in [DsEdit,DsInsert] then
  begin
    SBProdutoSeguranca.Enabled:=True;
    SBCaractProduto.Enabled:=True;
  end
  else
  begin
    SBProdutoSeguranca.Enabled:=False;
    SBCaractProduto.Enabled:=False;
  end;
end;

procedure TFCompraProdutoCad.A1Click(Sender: TObject);
begin
  inherited;
  if FSegurancaParam = Nil then
    FSegurancaParam := TFSegurancaParam.Create(Application);
  FSegurancaParam.PGRelatorio.Pages[3].TabVisible := True;
  if FSegurancaParam.ShowModal = mrOk then
  with DMCompraSeguranca do
  begin
    QRMovEstoqueSeg.Close;
    if Trim(FSegurancaParam.ME4DtInicial.Text) = '' then
      Raise Exception.Create('A Data Inicial deve ser Informada');
    if Trim(FSegurancaParam.ME4DtFinal.Text) = '' then
      FSegurancaParam.ME4DtFinal.Text := DateToStr(date);
    QRMovEstoqueSeg.SetVariable('DATA_I',FSegurancaParam.ME4DtInicial.Text);
    QRMovEstoqueSeg.SetVariable('DATA_F',FSegurancaParam.ME4DtFinal.Text);
    if Trim(FSegurancaParam.ME4Filial.Text)<> '' then
      QRMovEstoqueSeg.SetVariable('COD_FILIAL',Trim(FSegurancaParam.ME4Filial.Text))
    else
      QRMovEstoqueSeg.SetVariable('COD_FILIAL',null);
    if trim(FSegurancaParam.ME4Produto.Text) <> '' then
      QRMovEstoqueSeg.SetVariable('COD_PRODUTO_SEGURANCA',Trim(FSegurancaParam.ME4Produto.Text))
    else
      QRMovEstoqueSeg.SetVariable('COD_PRODUTO_SEGURANCA',null);
    QRMovEstoqueSeg.Open;
    if FRMovEstoqueSeg = nil then
      FRMovEstoqueSeg := TFRMovEstoqueSeg.Create(Application);
    FRMovEstoqueSeg.QRLTitulo.Caption := 'Mov. de Estoque de Segurança no Período De '+
                                         Trim(FSegurancaParam.ME4DtInicial.Text)+' Até '+
                                         Trim(FSegurancaParam.ME4DtFinal.Text);
    FRMovEstoqueSeg.QRLFilial.Caption := 'Filial :'+ Trim(FSegurancaParam.ED4Filial.Text);
    if FSegurancaParam.RGPreview.ItemIndex = 0 then
      FRMovEstoqueSeg.QRPrimario.Preview
    else
      FRMovEstoqueSeg.QRPrimario.print;
    QRMovEstoqueSeg.close;
  end;
end;

procedure TFCompraProdutoCad.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpContext(10);
end;

procedure TFCompraProdutoCad.PosioCompra1Click(Sender: TObject);
begin
  inherited;
  if FSegurancaParam = nil then
    FSegurancaParam := TFSegurancaParam.Create(Application);
  FSegurancaParam.PGRelatorio.Pages[13].TabVisible := True;
  if FSegurancaParam.ShowModal = mrOk then
  with DMCompraSeguranca do
  begin
    QRPosicaoCompra.Close;
    if Trim(FSegurancaParam.ME14Filial.Text) <> '' then
      QRPosicaoCompra.SetVariable('COD_FILIAL',Trim(FSegurancaParam.ME14Filial.Text))
    else
      QRPosicaoCompra.SetVariable('COD_FILIAL',Null);
    if Trim(FSegurancaParam.ME14Produto.Text) <> '' then
      QRPosicaoCompra.SetVariable('COD_PRODUTO_SEGURANCA',Trim(FSegurancaParam.ME14Produto.Text))
    else
      QRPosicaoCompra.SetVariable('COD_PRODUTO_SEGURANCA',Null);
    QRPosicaoCompra.Open;
    if FRPosicaoCompra = nil then
      FRPosicaoCompra := TFRPosicaoCompra.Create(Application);
    if FSegurancaParam.RGPreview.ItemIndex = 0 then
      FRPosicaoCompra.QRPrimario.Preview
    else
      FRPosicaoCompra.QRPrimario.print;
    QRPosicaoCompra.Close;
  end;
end;

procedure TFCompraProdutoCad.DSPrimarioDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
    with DMCompraSeguranca.QCompraEquipCabIND_SITUACAO do
    if Value = 'DIGITADA' then
      DBText1.Font.Color := clRed
    else
      DBText1.Font.Color := clGreen;
end;

end.
