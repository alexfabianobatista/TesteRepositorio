unit UTransfEstoqueCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, Grids, DBGrids, variants, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, ActnList;

type
  TFTransfEstoqueCad = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    SBOrigem: TSpeedButton;
    SBDestino: TSpeedButton;
    DBText1: TDBText;
    Bevel1: TBevel;
    DBNavigator1: TDBNavigator;
    DSItem: TDataSource;
    Label7: TLabel;
    DBEdit9: TDBEdit;
    Label8: TLabel;
    DBEdit10: TDBEdit;
    Label9: TLabel;
    DBEdit11: TDBEdit;
    Label10: TLabel;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    Label13: TLabel;
    DBEdit15: TDBEdit;
    SBProduto: TSpeedButton;
    SBCaracteristica: TSpeedButton;
    DBGrid1: TDBGrid;
    Operaes1: TMenuItem;
    ConfirmarTransferncia1: TMenuItem;
    VoltarConfirmao1: TMenuItem;
    ImpTermoTransf1: TMenuItem;
    RelTransferncias1: TMenuItem;
    procedure SBOrigemClick(Sender: TObject);
    procedure SBDestinoClick(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure SBProdutoClick(Sender: TObject);
    procedure SBCaracteristicaClick(Sender: TObject);
    procedure DBEdit10Exit(Sender: TObject);
    procedure DSItemStateChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ConfirmarTransferncia1Click(Sender: TObject);
    procedure VoltarConfirmao1Click(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure ImpTermoTransf1Click(Sender: TObject);
    procedure RelTransferncias1Click(Sender: TObject);
    procedure SBHelpClick(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FTransfEstoqueCad: TFTransfEstoqueCad;

implementation

uses UEstoqueSeguranca_cl, UFilialCons, UProdutoSegurancaCons,
  UCaracteristicaProdutoCons, UProdutoSeguranca_cl,
  UCaracteristicaProduto_cl, UFilial_cl, UOracle_cl, UtransfEstoqueCons,
  URImpTransf, UParamSistema_cl, USegurancaParam, URTransfEstoque,
  UUsuario_cl;

{$R *.DFM}

procedure TFTransfEstoqueCad.SBOrigemClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.create(application);
  if FFilialCons.showmodal = mrOk then
    DMEstoqueSeguranca.QTransfEstoqueCOD_FILIAL_ORIGEM.Text := DMFilial.QFilialConsCod_Filial.Text;
end;

procedure TFTransfEstoqueCad.SBDestinoClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.create(application);
  if FFilialCons.showmodal = mrOk then
    DMEstoqueSeguranca.QTransfEstoqueCOD_FILIAL_DESTINO.Text := DMFilial.QFilialConsCod_Filial.Text;
end;

procedure TFTransfEstoqueCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  if DSPrimario.State in [DSInsert,DSEdit] then
  begin
    ConfirmarTransferncia1.Enabled := False;
    VoltarConfirmao1.Enabled := False;
    SBOrigem.Enabled := True;
    SBDestino.Enabled := True;
  end
  else
  begin
    SBOrigem.Enabled := False;
    SBDestino.Enabled := False;
    if DMEstoqueSeguranca.QTransfEstoqueInd_Situacao.Value = 'CONFIRMADA' then
    begin
      ConfirmarTransferncia1.Enabled:=False;
      VoltarConfirmao1.Enabled:=True;
    end
    else if DMEstoqueSeguranca.QTransfEstoqueInd_Situacao.Value = 'DIGITADA' then
    begin
      ConfirmarTransferncia1.Enabled:=True;
      VoltarConfirmao1.Enabled:=False;
    end
    else
    begin
      ConfirmarTransferncia1.Enabled:=False;
      VoltarConfirmao1.Enabled:=False;
    end;
  end;

  if DSPrimario.State in [DSEdit] then
  begin
    DBEdit2.Enabled := False;
    DBEdit3.Enabled := False;
  end
  else
  begin
    DBEdit2.Enabled := True;
    DBEdit3.Enabled := True;
  end;
end;

procedure TFTransfEstoqueCad.SBProdutoClick(Sender: TObject);
begin
  inherited;
  if FProdutoSegurancaCons = nil then
    FProdutoSegurancaCons := TFProdutoSegurancaCons.create(application);
  if FProdutoSegurancaCons.showmodal = mrOk then
    DMEstoqueSeguranca.QTransfEstoqueItemCOD_PRODUTO_SEGURANCA.Text := DMProdutoSeguranca.QProdutoSegurancaConsCod_Produto_Seguranca.Text;
end;

procedure TFTransfEstoqueCad.SBCaracteristicaClick(Sender: TObject);
begin
  inherited;
  if FCaracteristicaProdutoCons = nil then
    FCaracteristicaProdutoCons := TFCaracteristicaProdutoCons.create(application);
  if FCaracteristicaProdutoCons.showModal = mrOk then
    DMEstoqueSeguranca.QTransfEstoqueItemCOD_CARACTERISTICA_PRODUTO.Text := DMCaracteristicaProduto.QCaracteristicaProdutoConsCod_Caracteristica_Produto.Text;
end;

procedure TFTransfEstoqueCad.DBEdit10Exit(Sender: TObject);
begin
  inherited;
  with DMEstoqueSeguranca do
  begin
    if (Trim(QTransfEstoqueCOD_FILIAL_ORIGEM.Text)<>'') and
       (Trim(QTransfEstoqueItemCOD_PRODUTO_SEGURANCA.Text)<>'')      and
       (Trim(QTransfEstoqueItemCOD_CARACTERISTICA_PRODUTO.Text)<>'') then
    begin
      QEstoqueAtual.Close;
      QEstoqueAtual.SetVariable('PRODUTO_SEGURANCA',Trim(QTransfEstoqueItemCOD_PRODUTO_SEGURANCA.Text));
      QEstoqueAtual.SetVariable('CARACTERISTICA_PRODUTO',Trim(QTransfEstoqueItemCOD_CARACTERISTICA_PRODUTO.Text));
      QEstoqueAtual.SetVariable('FILIAL',Trim(QTransfEstoqueCOD_FILIAL_ORIGEM.Text));
      QEstoqueAtual.Open;
      QTransfEstoqueItemVL_CUSTO.Text := QEstoqueAtualVL_CUSTO_MEDIO.Text;
    end;
  end;
end;

procedure TFTransfEstoqueCad.DSItemStateChange(Sender: TObject);
begin
  inherited;
  if DSItem.DataSet.State in [DSInsert,DSEdit] then
  begin
    SBProduto.Enabled := True;
    SBCaracteristica.Enabled := True;
  end
  else
  begin
    SBProduto.Enabled := False;
    SBCaracteristica.Enabled := False;
  end;
end;

procedure TFTransfEstoqueCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMEstoqueSeguranca.QTransfEstoque.Open;
  DMEstoqueSeguranca.QTransfEstoqueItem.Open;
end;

procedure TFTransfEstoqueCad.ConfirmarTransferncia1Click(Sender: TObject);
begin
  inherited;
  if DMEstoqueSeguranca.QTransfEstoqueInd_Situacao.Value = 'CONFIRMADA' then
    Raise Exception.Create('Transferência já Confirmada');
  DMEstoqueSeguranca.QTransfEstoque.Edit;
  DMEstoqueSeguranca.QTransfEstoqueIND_SITUACAO.Text := 'CONFIRMADA';
  DMEstoqueSeguranca.QTransfEstoque.Post;
end;

procedure TFTransfEstoqueCad.VoltarConfirmao1Click(Sender: TObject);
begin
  inherited;
  if DMEstoqueSeguranca.QTransfEstoqueInd_Situacao.Value = 'DIGITADA' then
    Raise Exception.Create('Transferência não Confirmada');

  DMOracle.DBCemapa.StartTransaction;
  DMOracle.QExecSQL.Close;
  DMOracle.QExecSQL.SQL.Clear;
  DMOracle.QExecSQL.SQL.Add('UPDATE TB_TRANSF_ESTOQUE_CAB ');
  DMOracle.QExecSQL.SQL.Add('SET IND_SITUACAO = '+CHR(39)+'DIGITADA'+CHR(39));
  DMOracle.QExecSQL.SQL.Add('WHERE COD_TRANSF_ESTOQUE_CAB = '+DMEstoqueSeguranca.QTransfEstoqueCOD_TRANSF_ESTOQUE_CAB.Text);
  DMOracle.QExecSQL.ExecSQL;
  DMOracle.DBCemapa.Commit;
  DMEstoqueSeguranca.QTransfEstoque.RefreshRecord;
  DSPrimarioStateChange(Self);
end;

procedure TFTransfEstoqueCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FTransfEstoqueCons = nil then
    FTransfEstoqueCons := TFTransfEstoqueCons.Create(Application);
  if FTransfEstoqueCons.showModal = mrOk then
  begin
    with DMEstoqueSeguranca do
    begin
      QTransfEstoque.Close;
      QTransfEstoque.SetVariable('PK',QTransfEstoqueConsCOD_TRANSF_ESTOQUE_CAB.Value);
      QTransfEstoque.Open;
    end;
  end;
end;

procedure TFTransfEstoqueCad.ImpTermoTransf1Click(Sender: TObject);
begin
  inherited;
  with DMEstoqueSeguranca do
  begin
    if QTransfEstoqueCOD_TRANSF_ESTOQUE_CAB.Text = '' then
      raise Exception.Create('A Transferência deve ser informada');
    QRImpTransf.Close;
    QRImpTransf.SetVariable('COD_TRANSF_ESTOQUE',Trim(QTransfEstoqueCOD_TRANSF_ESTOQUE_CAB.Text));
    QRImpTransf.Open;
    if FRImpTransf = nil then
      FRImpTransf := TFRImpTransf.Create(Application);
    FRImpTransf.QRLEmpresa.Caption := DMParamSistema.QParamSistemaDESC_EMPRESA.Value;
    FRImpTransf.QRLLocalData.Caption := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
                                                           'COD_FILIAL = '+Trim(QTransfEstoqueCOD_FILIAL_ORIGEM.Text))+
                                        FormatDateTime(', dd "de" mmmm "de" yyyy',QRImpTransfDT_TRANSFERENCIA.Value);
    FRImpTransf.QRPrimario.Preview;
    QRImpTransf.close;
  end;
end;

procedure TFTransfEstoqueCad.RelTransferncias1Click(Sender: TObject);
begin
  inherited;
  if FSegurancaParam = Nil then
    FSegurancaParam := TFSegurancaParam.Create(Application);
  FSegurancaParam.PGRelatorio.Pages[12].TabVisible := True;
  if FSegurancaParam.ShowModal = mrOk then
  with DMEstoqueSeguranca do
  begin
    QRTransfEstoque.Close;

    if Trim(FSegurancaParam.ME13DtInicial.Text) <> '' then
      QRTransfEstoque.SetVariable('DATA_I',Trim(FSegurancaParam.ME13DtInicial.Text))
    else
      Raise Exception.Create('É preciso informar a data inicial');

    if Trim(FSegurancaParam.ME13DtFinal.Text) = '' then
      FSegurancaParam.ME13DtFinal.Text := DateToStr(Date);
    QRTransfEstoque.SetVariable('DATA_F',Trim(FSegurancaParam.ME13DtFinal.Text));

    if Trim(FSegurancaParam.ME13FilialOrig.Text)<> '' then
      QRTransfEstoque.SetVariable('FILIAL_ORIG',Trim(FSegurancaParam.ME13FilialOrig.Text))
    else
      QRTransfEstoque.SetVariable('FILIAL_ORIG',Null);

    if Trim(FSegurancaParam.ME13FilialDest.Text)<> '' then
      QRTransfEstoque.SetVariable('FILIAL_DEST',Trim(FSegurancaParam.ME13FilialDest.Text))
    else
      QRTransfEstoque.SetVariable('FILIAL_DEST',Null);

    if Trim(FSegurancaParam.ME13Produto.Text) <> '' then
      QRTransfEstoque.SetVariable('PRODUTO',Trim(FSegurancaParam.ME13Produto.Text))
    else
      QRTransfEstoque.SetVariable('PRODUTO',Null);
    QRTransfEstoque.Open;

    if FRTransfEstoque = nil then
      FRTransfEstoque := TFRTransfEstoque.Create(Application);
    FRTransfEstoque.QRLFilialOrig.Caption :='Filial Origem : '+FSegurancaParam.Ed13FilialOrig.Text;
    FRTransfEstoque.QRLFilialDest.Caption :='Filial Destino: '+FSegurancaParam.Ed13FilialDest.Text;
    FRTransfEstoque.QRLPeriodo.Caption := 'Período: De '+Trim(FSegurancaParam.ME13DtInicial.Text)+
                                          ' Até '+Trim(FSegurancaParam.ME13DtFinal.Text);
    if FSegurancaParam.RGPreview.ItemIndex = 0 then
      FRTransfEstoque.QRPrimario.Preview
    else
      FRTransfEstoque.QRPrimario.print;
    QRTransfEstoque.Close;
  end;
end;

procedure TFTransfEstoqueCad.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpContext(13);
end;

procedure TFTransfEstoqueCad.DBEdit2Exit(Sender: TObject);
begin
  inherited;
  //caso usuário náo for privilegiado
  //valida sua filial


//COMENTADO POR FABIANO EM 12/02/2005,
//A PEDIDO DO RODRIGO DA AB
//POIS UM DOS USUARIOS NAO ESTAVA CONSEGUINDO FAZER AS TRANSFERENCIAS
//
//  if DMUsuario.Privilegiado = False then
//  begin
//    if DMUsuario.CodFilialUsuario <> StrToInt(DBEdit2.Text) then
//    begin
//      DMEstoqueSeguranca.QTransfEstoqueCOD_FILIAL_ORIGEM.Clear;
//      Raise Exception.Create('Usuário não possui permissão para realizar a Operação');
//    end;
//  end;
end;

end.
