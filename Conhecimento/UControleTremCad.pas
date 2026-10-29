{$A8,B-,C+,D+,E-,F-,G+,H+,I+,J+,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
{$WARN SYMBOL_DEPRECATED ON}
{$WARN SYMBOL_LIBRARY ON}
{$WARN SYMBOL_PLATFORM ON}
{$WARN UNIT_LIBRARY ON}
{$WARN UNIT_PLATFORM ON}
{$WARN UNIT_DEPRECATED ON}
{$WARN HRESULT_COMPAT ON}
{$WARN HIDING_MEMBER ON}
{$WARN HIDDEN_VIRTUAL ON}
{$WARN GARBAGE ON}
{$WARN BOUNDS_ERROR ON}
{$WARN ZERO_NIL_COMPAT ON}
{$WARN STRING_CONST_TRUNCED ON}
{$WARN FOR_LOOP_VAR_VARPAR ON}
{$WARN TYPED_CONST_VARPAR ON}
{$WARN ASG_TO_TYPED_CONST ON}
{$WARN CASE_LABEL_RANGE ON}
{$WARN FOR_VARIABLE ON}
{$WARN CONSTRUCTING_ABSTRACT ON}
{$WARN COMPARISON_FALSE ON}
{$WARN COMPARISON_TRUE ON}
{$WARN COMPARING_SIGNED_UNSIGNED ON}
{$WARN COMBINING_SIGNED_UNSIGNED ON}
{$WARN UNSUPPORTED_CONSTRUCT ON}
{$WARN FILE_OPEN ON}
{$WARN FILE_OPEN_UNITSRC ON}
{$WARN BAD_GLOBAL_SYMBOL ON}
{$WARN DUPLICATE_CTOR_DTOR ON}
{$WARN INVALID_DIRECTIVE ON}
{$WARN PACKAGE_NO_LINK ON}
{$WARN PACKAGED_THREADVAR ON}
{$WARN IMPLICIT_IMPORT ON}
{$WARN HPPEMIT_IGNORED ON}
{$WARN NO_RETVAL ON}
{$WARN USE_BEFORE_DEF ON}
{$WARN FOR_LOOP_VAR_UNDEF ON}
{$WARN UNIT_NAME_MISMATCH ON}
{$WARN NO_CFG_FILE_FOUND ON}
{$WARN MESSAGE_DIRECTIVE ON}
{$WARN IMPLICIT_VARIANTS ON}
{$WARN UNICODE_TO_LOCALE ON}
{$WARN LOCALE_TO_UNICODE ON}
{$WARN IMAGEBASE_MULTIPLE ON}
{$WARN SUSPICIOUS_TYPECAST ON}
{$WARN PRIVATE_PROPACCESSOR ON}
{$WARN UNSAFE_TYPE ON}
{$WARN UNSAFE_CODE ON}
{$WARN UNSAFE_CAST ON}
unit UControleTremCad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, ImgList, DB, Menus, ComCtrls, StdCtrls, Mask,
  Buttons, ExtCtrls, DBCtrls, DBDirceu, Grids, DBGrids, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, ActnList;

type
  TFControleTremCad = class(TFTCadSimples)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    BtDestinatario: TBitBtn;
    DBDirceu2: TDBDirceu;
    ControleTrem1: TMenuItem;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
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
    Label11: TLabel;
    DBEdit11: TDBEdit;
    BtMotivo: TBitBtn;
    DBDirceu1: TDBDirceu;
    BtProduto: TBitBtn;
    DBDirceu3: TDBDirceu;
    BtFilial: TBitBtn;
    DBDirceu4: TDBDirceu;
    TabSheet2: TTabSheet;
    DSVagao: TDataSource;
    Label13: TLabel;
    DBEdit13: TDBEdit;
    Label14: TLabel;
    DBEdit14: TDBEdit;
    Label15: TLabel;
    DBEdit15: TDBEdit;
    Label16: TLabel;
    DBEdit16: TDBEdit;
    DBGridVagao: TDBGrid;
    DBNavigatorVagao: TDBNavigator;
    DSVagaoItem: TDataSource;
    Label21: TLabel;
    Label22: TLabel;
    DBGridVagaoItem: TDBGrid;
    MeDifPesoVagao: TMaskEdit;
    lblDifPesoVagao: TLabel;
    MeDifPesoNota: TMaskEdit;
    lblDifPesoNota: TLabel;
    Label18: TLabel;
    DBEdit18: TDBEdit;
    Label19: TLabel;
    DBEdit19: TDBEdit;
    NotasporVago1: TMenuItem;
    DSFluxoNota: TDataSource;
    DBGrid1: TDBGrid;
    SbInserirNota: TSpeedButton;
    SbRemoverNota: TSpeedButton;
    MePesoChegada: TMaskEdit;
    MePesoSaida: TMaskEdit;
    Label17: TLabel;
    DBEdit17: TDBEdit;
    Label20: TLabel;
    DBEdit20: TDBEdit;
    BtOrigem: TBitBtn;
    DBDirceu5: TDBDirceu;
    GbFrete: TGroupBox;
    Label23: TLabel;
    DBEdit21: TDBEdit;
    Label24: TLabel;
    DBEdit22: TDBEdit;
    SbOperacao: TSpeedButton;
    SbTributacao: TSpeedButton;
    lblCidade: TLabel;
    DBDirceu7: TDBDirceu;
    lblEstado: TLabel;
    DBDirceu9: TDBDirceu;
    Label25: TLabel;
    Label26: TLabel;
    DBRGModal: TDBRadioGroup;
    Label12: TLabel;
    DBEdit12: TDBEdit;
    DBDirceu6: TDBDirceu;
    DBDirceu8: TDBDirceu;
    DBDirceu10: TDBDirceu;
    DBDirceu11: TDBDirceu;
    Label27: TLabel;
    DBEdit2: TDBEdit;
    Label2: TLabel;
    DBEdit23: TDBEdit;
    LblSituacao: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure BtDestinatarioClick(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure ControleTrem1Click(Sender: TObject);
    procedure BtMotivoClick(Sender: TObject);
    procedure BtProdutoClick(Sender: TObject);
    procedure BtFilialClick(Sender: TObject);
    procedure SBCancelarClick(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure DSVagaoStateChange(Sender: TObject);
    procedure DBEdit15Exit(Sender: TObject);
    procedure MELocalizaExit(Sender: TObject);
    procedure DBEdit15Change(Sender: TObject);
    procedure NotasporVago1Click(Sender: TObject);
    procedure SbInserirNotaClick(Sender: TObject);
    procedure SbRemoverNotaClick(Sender: TObject);
    procedure SBAlterarClick(Sender: TObject);
    procedure DBGridVagaoItemCellClick(Column: TColumn);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure BtOrigemClick(Sender: TObject);
    procedure SbOperacaoClick(Sender: TObject);
    procedure SbTributacaoClick(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure MePesoChegadaExit(Sender: TObject);
  private
    { Private declarations }
    procedure AtualizaDSFluxoNota(fluxo: integer);
  public
    { Public declarations }
    wPesoTotal, wFreteTotal :Real;
  end;

var
  FControleTremCad: TFControleTremCad;

implementation

uses UControleTrem_cl, UOracle_cl, UCadastroCons, UCadastro_cl,
  UNotaEntradaCons, UNotaEntrada_cl, UNotaSaidaCons, UNotaSaida_cl,
  UFilialCons, UFilial_cl, UControleTremCons, UControleTremParam,
  URControleTrem, UMotivoCons, UProdutoCons, UMotivo_cl, UProduto_cl,
  UUsuario_cl, DateUtils, URVagaoNota, UOperacaoCons, UOperacao_cl,
  UTributacaoCons, UTributacao_cl;

{$R *.dfm}

procedure TFControleTremCad.FormActivate(Sender: TObject);
begin
  inherited;
  DSPrimario.DataSet.Open;
  DSVagao.DataSet.Open;
  DSVagaoItem.DataSet.Open;
  DBRGModal.ItemIndex := 2;
end;

procedure TFControleTremCad.BtDestinatarioClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = MrOk then
     DMControleTrem.QControleTremCOD_CADASTRO_DESTINATARIO.Value := DMCadastro.QCadastroConsCOD_CADASTRO.value;
end;

procedure TFControleTremCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FControleTremCons = Nil then
    FControleTremCons := TFControleTremCons.Create(Application);
  if FControleTremCons.ShowModal = MrOk then
  begin
    MELocaliza.Text := DMControleTrem.QControleTremConsCOD_FLUXO_TREM.Text;
    MELocalizaExit(self);
  end;
end;

procedure TFControleTremCad.ControleTrem1Click(Sender: TObject);
begin
  inherited;
  if FControleTremParam = Nil then
    FControleTremParam := TFControleTremParam.Create(Application);
  FControleTremParam.PGRelatorio.Pages[0].TabVisible := true;
  if FControleTremParam.ShowModal = MrOk then
  begin
    with DMControleTrem do
    begin
      QRControleTrem.Close;
      if Trim(FControleTremParam.Me1Remetente.Text) <> '' then
        QRControleTrem.SetVariable('REMETENTE', Trim(FControleTremParam.Me1Remetente.Text))
      else
        QRControleTrem.SetVariable('REMETENTE', null);

      if Trim(FControleTremParam.Me1Destinatario.Text) <> '' then
        QRControleTrem.SetVariable('DESTINATARIO', Trim(FControleTremParam.Me1Destinatario.Text))
      else
        QRControleTrem.SetVariable('DESTINATARIO', null);

      QRControleTrem.SetVariable('DATA_I', Trim(FControleTremParam.Me1Data_I.Text));
      QRControleTrem.SetVariable('DATA_F', Trim(FControleTremParam.Me1Data_F.Text));
      QRControleTrem.Open;
    end;
    if FRControleTrem = Nil then
      FRControleTrem := TFRControleTrem.Create(Application);
      FRControleTrem.QRLRemetente.Caption := FControleTremParam.Ed1Remetente.Text;
      FRControleTrem.QRLDestinatario.Caption := FControleTremParam.Ed1Destinatario.Text;
      FRControleTrem.QRLData_I.Caption := FControleTremParam.Me1Data_I.Text;
      FRControleTrem.QRLData_F.Caption := FControleTremParam.Me1Data_F.Text;
    if FControleTremParam.RGPreview.ItemIndex = 0 then
      FRControleTrem.QRPrimario.Preview
    else
      FRControleTrem.QRPrimario.Print;
  end;
end;

procedure TFControleTremCad.BtMotivoClick(Sender: TObject);
begin
  inherited;
  if FMotivoCons = Nil then
    FMotivoCons := TFMotivoCons.Create(Application);
  if FMotivoCons.ShowModal = MrOk then
     DMControleTrem.QControleTremCOD_Motivo.Value := DMMotivo.QMotivoConsCOD_MOTIVO.value;

end;

procedure TFControleTremCad.BtProdutoClick(Sender: TObject);
begin
  inherited;
  if FProdutoCons = Nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = MrOk then
     DMControleTrem.QControleTremCOD_PRODUTO.Text := DMProduto.QProdutoConsCOD_PRODUTO.text;

end;

procedure TFControleTremCad.BtFilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = MrOk then
     DMControleTrem.QControleTremCOD_FILIAL.Value := DMFilial.QFilialConsCOD_FILIAL.value;

end;

procedure TFControleTremCad.SBCancelarClick(Sender: TObject);
begin
  With DMControleTrem do
  Begin
    If QVagao.State in [dsEdit,dsInsert] then
    begin
      DSVagao.DataSet.Cancel;
      DSVagaoItem.DataSet.Cancel;
    end;
  End;
  inherited;
end;

procedure TFControleTremCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  MeDifPesoVagao.Text := '';
  MeDifPesoNota.Text  := '';

  if DSPrimario.State in [DsInsert, DsEdit] then
  begin
    DMControleTrem.QControleTremCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
    DMControleTrem.QControleTremDT_USUARIO.Value  := Now;
  end;

  with DMControleTrem do
  begin
    If QControleTremIND_SITUACAO.Text = '1' Then
      LblSituacao.Caption := 'ABERTO';
    If QControleTremIND_SITUACAO.Text = '2' Then
      LblSituacao.Caption := 'ATENDIDO';
    If QControleTremIND_SITUACAO.Text = '3' Then
      LblSituacao.Caption := 'CANCELADO';
  end;
end;

procedure TFControleTremCad.PageControl1Change(Sender: TObject);
begin
  inherited;
  with DMControleTrem do
  begin
    if PageControl1.ActivePage = TabSheet2 then
    begin
      if DSPrimario.State in [DsInsert, DsEdit] then
      begin
        DSPrimario.DataSet.Post;
        DSVagao.DataSet.Edit;
        DSVagaoItem.DataSet.Edit;
      end;
    end;
  end;
end;

procedure TFControleTremCad.DSVagaoStateChange(Sender: TObject);
begin
  inherited;
  if DSVagao.State in [DsInsert, DsEdit] then
  begin
    DMControleTrem.QVagaoCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
    DMControleTrem.QVagaoDT_USUARIO.Value  := Now;
  end;
end;

procedure TFControleTremCad.DBEdit15Exit(Sender: TObject);
begin
  inherited;
  with DMControleTrem do
  begin
  if (Trim(QVagaoQT_QUANTIDADE.Text) <> '') and (Trim(QVagaoQT_PESO_CHEGADA.Text) <> '') then
    MeDifPesoVagao.Text := FloatToStr(QVagaoQT_QUANTIDADE.Value - QVagaoQT_PESO_CHEGADA.Value);
  end;
end;

procedure TFControleTremCad.MELocalizaExit(Sender: TObject);
begin
  inherited;
  if DBEdit15.Text <> '' then
    DBEdit15Exit(self);
  //---------------------------
  //Preenche o DBGrid com as Notas associadas ao Fluxo de Trem
  AtualizaDSFluxoNota(DMControleTrem.QControleTremConsCOD_FLUXO_TREM.Value);
  //---------------------------
end;

procedure TFControleTremCad.AtualizaDSFluxoNota(fluxo: integer);
begin
  DSFluxoNota.DataSet.Close;
  DMControleTrem.QFluxoNota.SetVariable('FLUXO', fluxo);
  DSFluxoNota.DataSet.Open;
end;

procedure TFControleTremCad.DBEdit15Change(Sender: TObject);
begin
  inherited;
  DBEdit15Exit(self);
end;

procedure TFControleTremCad.NotasporVago1Click(Sender: TObject);
begin
  inherited;
  if FControleTremParam = Nil then
    FControleTremParam := TFControleTremParam.Create(Application);
  FControleTremParam.PGRelatorio.Pages[1].TabVisible := true;
  if FControleTremParam.ShowModal = MrOk then
  begin
    with DMControleTrem do
    begin
      QRVagaoNota.Close;

      if Trim(FControleTremParam.MeFluxoTrem.Text) <> '' then
        QRVagaoNota.SetVariable('COD_FLUXO', Trim(FControleTremParam.MeFluxoTrem.Text))
      else
        QRVagaoNota.SetVariable('COD_FLUXO', null);

      if Trim(FControleTremParam.Me2Data_I.Text) <> '' then
        QRVagaoNota.SetVariable('DATA_I', Trim(FControleTremParam.Me2Data_I.Text))
      else
        Raise Exception.Create('Deve-se Informe uma Data Inicial.');
      if Trim(FControleTremParam.Me2Data_F.Text) <> '' then
        QRVagaoNota.SetVariable('DATA_F', Trim(FControleTremParam.Me2Data_F.Text))
      else
        QRVagaoNota.SetVariable('DATA_F', date);

      QRVagaoNota.Open;
    end;
    if FRVagaoNota = Nil then
      FRVagaoNota := TFRVagaoNota.Create(Application);

    //cabeçalho
    //----------------------------------
    FRVagaoNota.QRLTitulo.Caption := 'Relatório de Peso - Por Notas e Por Vagões';
    FRVagaoNota.QRLData_I.Caption := FControleTremParam.Me2Data_I.Text;
    FRVagaoNota.QRLData_F.Caption := FControleTremParam.Me2Data_F.Text;
    //----------------------------------

    if FControleTremParam.RGPreview.ItemIndex = 0 then
      FRVagaoNota.QRPrimario.Preview
    else
      FRVagaoNota.QRPrimario.Print;
  end;
end;

procedure TFControleTremCad.SbInserirNotaClick(Sender: TObject);
begin
  inherited;
  with DMControleTrem do
  begin
    if Trim(QFluxoNotaNOTA_CAB.Text) <> '' then
    begin
      if (Trim(QFluxoNotaQt_Chegada.Text) <> '') And (Trim(QFluxoNotaQt_Chegada.Text) <> '0') then
      begin
        DSVagaoItem.DataSet.Insert;
        QVagaoItemCOD_NOTA.Value        := QFluxoNotaNOTA_CAB.Value;
        QVagaoItemQT_PESO_CHEGADA.Value := QFluxoNotaQt_Chegada.Value;
        QVagaoItemQT_PESO_SAIDA.Value   := QFluxoNotaqt_quantidade_nota.Value;
        MeDifPesoNota.Text := FloatToStr(QVagaoItemQT_PESO_SAIDA.Value - QVagaoItemQT_PESO_CHEGADA.Value);
        DSVagaoItem.DataSet.Post;
        //Atualiza o DBGrid com as Notas
        AtualizaDSFluxoNota(DMControleTrem.QVagaoCOD_FLUXO_TREM.Value);
        DSPrimario.DataSet.Refresh;
      end
      else
        Raise Exception.Create('É Necessário Informar o Peso Chegada da Nota.');
    end
    else
      Raise Exception.Create('É Necessário Selecionar uma Nota para Completar a Operação.');
  end;
end;

procedure TFControleTremCad.SbRemoverNotaClick(Sender: TObject);
begin
  inherited;
   with DMControleTrem do
  begin
    if not DSVagaoItem.DataSet.IsEmpty then
    begin
      DSVagaoItem.DataSet.Delete;
      DSVagaoItem.DataSet.Close;
      DSVagaoItem.DataSet.Open;
      //Atualiza o DBGrid com as Notas
      AtualizaDSFluxoNota(DMControleTrem.QVagaoCOD_FLUXO_TREM.Value);
      DSPrimario.DataSet.Refresh;
    end
    else
      Raise Exception.Create('Não há Notas para Remoção.');
  end;
end;

procedure TFControleTremCad.SBAlterarClick(Sender: TObject);
begin
  inherited;
  DSVagao.DataSet.Edit;
end;

procedure TFControleTremCad.DBGridVagaoItemCellClick(Column: TColumn);
begin
  inherited;
  MePesoChegada.Text := DMControleTrem.QVagaoItemQT_PESO_CHEGADA.Text;
  MePesoSaida.Text   := DMControleTrem.QVagaoItemQT_PESO_SAIDA.Text;
  MeDifPesoNota.Text := FloatToStr(DMControleTrem.QVagaoItemQT_PESO_SAIDA.Value -
                                   DMControleTrem.QVagaoItemQT_PESO_CHEGADA.Value);
end;

procedure TFControleTremCad.DBGrid1CellClick(Column: TColumn);
begin
  inherited;
  MePesoChegada.Text := '';
  MePesoSaida.Text   := '';
  MeDifPesoNota.Text := '';
end;

procedure TFControleTremCad.BtOrigemClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = MrOk then
     DMControleTrem.QControleTremCOD_CADASTRO_ORIGEM.Value := DMCadastro.QCadastroConsCOD_CADASTRO.value;
end;

procedure TFControleTremCad.SbOperacaoClick(Sender: TObject);
begin
  inherited;
  if FOperacaoCons = Nil then
    FOperacaoCons := TFOperacaoCons.Create(Application);
  if FOperacaoCons.ShowModal = MrOk then
    DMControleTrem.QControleTremCOD_OPERACAO.Value := DMOperacao.QOperacaoConsCOD_OPERACAO.Value;
end;

procedure TFControleTremCad.SbTributacaoClick(Sender: TObject);
begin
  inherited;
  if FTributacaoCons = Nil then
    FTributacaoCons := TFTributacaoCons.Create(Application);
  if FTributacaoCons.ShowModal = MrOk then
    DMControleTrem.QControleTremCOD_TRIBUTACAO.Value := DMTributacao.QTributacaoConsCOD_TRIBUTACAO.Value;
end;

procedure TFControleTremCad.SBConfirmarClick(Sender: TObject);
begin
  if DBRGModal.ItemIndex = -1 then
    Raise Exception.Create('É Necessário informar um Modal.');
  inherited
end;

procedure TFControleTremCad.MePesoChegadaExit(Sender: TObject);
Var wComando : String;
begin
  inherited;
  If MePesoChegada.Text <> '' Then
  Begin
    With DMOracle do
    Begin
      QExecSQL.Close;
      QExecSQL.SQL.Clear;
      wComando := 'UPDATE TB_NOTA_ITEM SET QT_CHEGADA_TREM =' + Trim(MePesoChegada.Text);
      wComando := wComando + ' WHERE COD_NOTA_ITEM = '+FloatToStr(DMControleTrem.QFluxoNotaCod_Nota_Item.Value);
      QExecSQL.SQL.Add(wComando);
      QExecSQL.ExecSQL;
      DMOracle.DBCemapa.Commit;
    End;
    MePesoChegada.Clear;
  End;
end;

end.

