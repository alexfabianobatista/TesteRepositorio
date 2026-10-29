unit UDRECad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, DBDirceu, Grids, DBGrids, ToolWin, OracleNavigator, variants,
  ActnList, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP;

type
  TFDRECad = class(TFTCadSimples)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    TabSheet2: TTabSheet;
    DBGrid1: TDBGrid;
    DBEdit6: TDBEdit;
    BtPlanoConta: TBitBtn;
    Label5: TLabel;
    DRE1: TMenuItem;
    DBRadioGroup2: TDBRadioGroup;
    OracleNavigator1: TOracleNavigator;
    DBDirceu1: TDBDirceu;
    TabSheet3: TTabSheet;
    Label2: TLabel;
    DBGrid2: TDBGrid;
    DBEdit2: TDBEdit;
    BtGrupo: TBitBtn;
    OracleNavigator2: TOracleNavigator;
    DBDirceu2: TDBDirceu;
    DBRadioGroup1: TDBRadioGroup;
    TabSheet4: TTabSheet;
    DBGrid3: TDBGrid;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    CadastrodaDRE1: TMenuItem;
    procedure FormActivate(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure SBCancelarClick(Sender: TObject);
    procedure BtPlanoContaClick(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure DRE1Click(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure SBHelpClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBIncluirClick(Sender: TObject);
    procedure DSPrimarioDataChange(Sender: TObject; Field: TField);
    procedure DBRadioGroup2Click(Sender: TObject);
    procedure BtGrupoClick(Sender: TObject);
    procedure DBGrid3DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure CadastrodaDRE1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDRECad: TFDRECad;

implementation

uses UDRE_cl, UOracle_cl, UFilialCons, UFilial_cl, UPlanoContaCons,
  UPlanoConta_cl, UDRECons, URDREParam, UBiblioteca, URDRE,
  UConfirma_DRE, UUsuario_cl, UParamSistema_cl, URDRECadastro;

{$R *.DFM}

procedure TFDRECad.FormActivate(Sender: TObject);
begin
  inherited;
  with DMDRE do
  begin
    QGrupoDre.Open;
    QGrupoDreConta.Open;
    QGrupoDreGrupo.Open;
    QDreOrdem.Open;
  end;
end;

procedure TFDRECad.SBConfirmarClick(Sender: TObject);
var
  vcodigo: real;
begin
  vcodigo := DMDRE.QGrupoDreCOD_GRUPO_DRE.Value;
  inherited;
  try
    if DMDRE.QGrupoDreConta.State in [DSInsert, DSEdit] then
      DMDRE.QGrupoDreConta.Post;
    if DMDRE.QGrupoDreGrupo.State in [DSInsert, DSEdit] then
      DMDRE.QGrupoDreGrupo.Post;
    DMOracle.DBCemapa.Commit;
    DMDRE.QGrupoDre.Close;
    DMDRE.QGrupoDre.SetVariable('PK', vCodigo);
    DMDRE.QGrupoDre.Open;
  except
    DMOracle.DBCemapa.RollBack;
    raise Exception.Create('Não foi possível incluir. Verifique pendências nos lançamentos');
  end;
end;

procedure TFDRECad.SBCancelarClick(Sender: TObject);
begin
  inherited;
  if DMDRE.QGrupoDreConta.State in [DSInsert, DSEdit] then
    DMDRE.QGrupoDreConta.Cancel;
  if DMDRE.QGrupoDreGrupo.State in [DSInsert, DSEdit] then
    DMDRE.QGrupoDreGrupo.Cancel;
  DMOracle.DBCemapa.Rollback;
  DMDRE.QGrupoDre.Close;
  DMDRE.QGrupoDre.Open;
end;

procedure TFDRECad.BtPlanoContaClick(Sender: TObject);
begin
  inherited;
  if FPlanoContaCons = nil then
    FPlanoContaCons := TFplanoContaCons.Create(Application);
  if FPlanoContaCons.ShowModal = MrOk then
  begin
    FPlanoContaCons.MECodFilial.Enabled := True;
    if not (DMDRE.QGrupoDreConta.State in [dsInsert, dsEdit]) then
      DMDRE.QGrupoDreConta.Edit;
    DMDRE.QGrupoDreContaCOD_PLANO_CONTA.Value := DMPlanoConta.QPlanoContaConsCOD_PLANO_CONTA.Value;
  end;
end;

procedure TFDRECad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FDRECons = nil then
    FDRECons := TFDRECons.Create(Application);
  if FDRECons.ShowModal = mrOk then
  begin
    with DMDRE do
    begin
      QGrupoDre.Close;
      QGrupoDre.SetVariable('PK', QGrupoDreConsCOD_GRUPO_DRE.Value);
      QGrupoDre.Open;
      QGrupoDreCons.Close;

      if DMDRE.QGrupoDreIND_TOTALIZADOR.Value = 'S' then
      begin
        TabSheet2.TabVisible := False;
        TabSheet3.TabVisible := True;
      end
      else
      begin
        TabSheet2.TabVisible := True;
        TabSheet3.TabVisible := False;
      end;
    end;
  end;
  FDRECons.Release;
  FDRECons := nil;
end;

procedure TFDRECad.DRE1Click(Sender: TObject);
var wContador, wResponsavel: Integer;
  wTrimestral: boolean;
begin
  inherited;

  wTrimestral := true;
  if FDREParam = nil then
    FDREParam := TFDREParam.Create(Application);

  FDREParam.PGRelatorio.Pages[0].TabVisible := True;
  if FDREParam.ShowModal = MrOk then
  begin
    if FDREParam.LbFiliais.Count = 0 then
      raise exception.Create('Deve ser informada no minimo uma filial!');

    if FDREParam.RGPeriodo.ItemIndex = 0 then
      wTrimestral := false;

    DMDRE.GeraDRE(StrToInt(Copy(FDREParam.MePeriodo.Text, 6, 2)), StrToInt(Copy(FDREParam.MePeriodo.Text, 1, 4)), FDREParam.GeraStringsFiliais, True, FDREParam.RgTipo.ItemIndex = 1, wTrimestral);

    if FRDRE = nil then
      FRDRE := TFRDRE.Create(Application);

    FRDRE.Pag_Inicial := StrToInt(Trim(FDREParam.MePagina.Text)) - 1;
    FRDRE.QRLPeriodo.Caption := FDREParam.MePeriodo.Text;
    FRDRE.QRLSaldoAtual.Caption := Copy(FDREParam.MePeriodo.Text, 1, 4) + '/' + Copy(FDREParam.MePeriodo.Text, 6, 2);
    FRDRE.QRLSaldoAnterior.Caption := inttostr(strtoint(Copy(FDREParam.MePeriodo.Text, 1, 4)) -1) + '/' + Copy(FDREParam.MePeriodo.Text, 6, 2);
    if DMParamSistema.QParamSistemaCod_Empresa.Value = 'GRASEL' then
    begin
      FRDRE.QRLContador.Caption := 'ELCIO LUIZ ZIMMERMANN';
      FRDRE.QRLCrc.Caption := 'CONTADOR CRC/PR 027.258-0/6';
      FRDRE.QRLCpf_Contador.Caption := 'CPF: 476.563.529-53';
      FRDRE.QRLCpf_Administrador.Caption := 'Cpf: 476.563.529-53';
      FRDRE.QRLTitular.Caption := 'ADAIR SILVIO GRASEL';
      FRDRE.QRLCpf_Administrador.Caption := 'CPF: 557.258.139-91';
    end
    {else if DMParamSistema.QParamSistemaCod_Empresa.Value = 'TEMPERMED' then
    begin
      FRDRE.QRLContador.Caption := 'PAULO GUSTMANN D`AVILA';
      FRDRE.QRLCrc.Caption := 'CONTADOR CRC/PR 044.801/O-0';
      FRDRE.QRLCpf_Contador.Caption := 'CPF: 498.877.349-34';
      FRDRE.QRLCpf_Administrador.Caption := 'Cpf: 588.414.829-15';
      FRDRE.QRLTitular.Caption := 'ROQUE COLOMBO';
      //FRDRE.QRLCpf_Administrador.Caption := 'CPF: 557.258.139-91';
    end }
    else
    begin
      try
        wContador := StrToInt(DMOracle.BuscaNome('SELECT COD_CADASTRO_CONTABILISTA FROM TB_FILIAL', 'COD_FILIAL = ' + FDREParam.pMatrizDRE))
      except
        wContador := 0;
      end;

      try
        wResponsavel := StrToInt(DMOracle.BuscaNome('SELECT COD_CADASTRO_RESPONSAVEL FROM TB_FILIAL', 'COD_FILIAL = ' + FDREParam.pMatrizDRE))
      except
        wResponsavel := 0;
      end;

      FRDRE.QRLContador.Caption := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO', 'COD_CADASTRO = ' + IntToStr(wContador));
      FRDRE.QRLCrc.Caption := 'CRC: ' + DMOracle.BuscaNome('SELECT DESC_CRC FROM TB_CADASTRO', 'COD_CADASTRO = ' + IntToStr(wContador));
      FRDRE.QRLCpf_Contador.Caption := 'CPF: ' + DMOracle.BuscaNome('SELECT NUM_CGC_CPF FROM TB_CADASTRO', 'COD_CADASTRO = ' + IntToStr(wContador));
      FRDRE.QRLTitular.Caption := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO', 'COD_CADASTRO = ' + IntToStr(wResponsavel));
      FRDRE.QRLCpf_Administrador.Caption := 'CPF: ' + DMOracle.BuscaNome('SELECT NUM_CGC_CPF FROM TB_CADASTRO', 'COD_CADASTRO = ' + IntToStr(wResponsavel));
    end;

    FRDRE.QRLSaldoAnterior.Enabled := (FDREParam.rgSaldoAnterior.ItemIndex = 0);
    FRDRE.tValorAnterior.Enabled := (FDREParam.rgSaldoAnterior.ItemIndex = 0);

    if FDREParam.RGPreview.ItemIndex = 0 then
      FRDRE.QRPrimario.Preview
    else
      FRDRE.QRPrimario.Print;
  end;
end;

procedure TFDRECad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  if DsPrimario.State in [DsInsert, DsEdit] then
  begin
    BtPlanoConta.Enabled := True;
    BtGrupo.Enabled := True;
  end
  else
  begin
    BtPlanoConta.Enabled := False;
    BtGrupo.Enabled := False;
  end;

  if DMDRE.QGrupoDreIND_TOTALIZADOR.Value = 'S' then
  begin
    TabSheet2.TabVisible := False;
    TabSheet3.TabVisible := True;
  end
  else
  begin
    TabSheet2.TabVisible := True;
    TabSheet3.TabVisible := False;
  end;
end;

procedure TFDRECad.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpContext(16);
end;

procedure TFDRECad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  with DMDRE do
  begin
    QGrupoDre.Close;
    QGrupoDreConta.Close;
    QGrupoDreGrupo.close;
    QDreOrdem.close;
  end;
  Action := CaFree;
  FDRECad := nil;
end;

procedure TFDRECad.SBIncluirClick(Sender: TObject);
begin
  inherited;
  if DMDRE.QGrupoDreIND_TOTALIZADOR.Value = 'S' then
  begin
    TabSheet2.TabVisible := False;
    TabSheet3.TabVisible := True;
  end
  else
  begin
    TabSheet2.TabVisible := True;
    TabSheet3.TabVisible := False;
  end;
end;

procedure TFDRECad.DSPrimarioDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  if Field = DMDRE.QGrupoDreIND_TOTALIZADOR then
  begin
    if DMDRE.QGrupoDreIND_TOTALIZADOR.Value = 'S' then
    begin
      TabSheet2.TabVisible := False;
      TabSheet3.TabVisible := True;
    end
    else
    begin
      TabSheet2.TabVisible := True;
      TabSheet3.TabVisible := False;
    end;
  end;
end;

procedure TFDRECad.DBRadioGroup2Click(Sender: TObject);
begin
  inherited;
  if DBRadioGroup2.ItemIndex = 0 then
  begin
    TabSheet2.TabVisible := False;
    TabSheet3.TabVisible := True;
  end
  else
  begin
    TabSheet2.TabVisible := True;
    TabSheet3.TabVisible := False;
  end;
end;

procedure TFDRECad.BtGrupoClick(Sender: TObject);
begin
  inherited;
  if FDRECons = nil then
    FDRECons := TFDRECons.Create(Application);
  if FDRECons.ShowModal = MrOk then
  begin
    if not (DMDRE.QGrupoDreGrupo.State in [dsInsert, dsEdit]) then
      DMDRE.QGrupoDreGrupo.Edit;
    DMDRE.QGrupoDreGrupoCOD_GRUPO_DRE_FILHO.Value := DMDRE.QGrupoDreConsCOD_GRUPO_DRE.Value;
  end;
end;

procedure TFDRECad.DBGrid3DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  //  if (Column = DBGrid3.Columns[0]) then
  //  Begin
  //    if DMDRE.QDreOrdemIND_TOTALIZADOR.Value = 'S' then
  //      Column.Font.Style := [fsBold]
  //    else
  //      Column.Font.Style := [];
  //  End;
end;

procedure TFDRECad.SpeedButton1Click(Sender: TObject);
var
  codigoOrigem, ordemOrigem, codigoDestino, ordemDestino, recNo: Integer;
begin
  inherited;
  codigoOrigem := DMDRE.QDreOrdemCOD_GRUPO_DRE.Value;
  ordemOrigem := DMDRE.QDreOrdemNUM_ORDEM.Value;
  recNo := DMDRE.QDreOrdem.RecNo;
  DMDRE.QDreOrdem.Prior;
  if DMDRE.QDreOrdemCOD_GRUPO_DRE.Value <> codigoOrigem then
  begin
    codigoDestino := DMDRE.QDreOrdemCOD_GRUPO_DRE.Value;
    ordemDestino := DMDRE.QDreOrdemNUM_ORDEM.Value;

    DMDRE.QDreOrdem.Edit;
    DMDRE.QDreOrdemNUM_ORDEM.Value := ordemOrigem;
    DMDRE.QDreOrdem.Post;

    DMDRE.QDreOrdem.Next;

    DMDRE.QDreOrdem.Edit;
    DMDRE.QDreOrdemNUM_ORDEM.Value := ordemDestino;
    DMDRE.QDreOrdem.Post;

    DMDRE.QDreOrdem.Refresh;

    DMDRE.QDreOrdem.RecNo := recNo - 1;
  end;
end;

procedure TFDRECad.SpeedButton2Click(Sender: TObject);
var
  codigoOrigem, ordemOrigem, codigoDestino, ordemDestino, recNo: Integer;
begin
  inherited;
  codigoOrigem := DMDRE.QDreOrdemCOD_GRUPO_DRE.Value;
  ordemOrigem := DMDRE.QDreOrdemNUM_ORDEM.Value;
  recNo := DMDRE.QDreOrdem.RecNo;
  DMDRE.QDreOrdem.Next;
  if DMDRE.QDreOrdemCOD_GRUPO_DRE.Value <> codigoOrigem then
  begin
    codigoDestino := DMDRE.QDreOrdemCOD_GRUPO_DRE.Value;
    ordemDestino := DMDRE.QDreOrdemNUM_ORDEM.Value;

    DMDRE.QDreOrdem.Edit;
    DMDRE.QDreOrdemNUM_ORDEM.Value := ordemOrigem;
    DMDRE.QDreOrdem.Post;

    DMDRE.QDreOrdem.Prior;

    DMDRE.QDreOrdem.Edit;
    DMDRE.QDreOrdemNUM_ORDEM.Value := ordemDestino;
    DMDRE.QDreOrdem.Post;

    DMDRE.QDreOrdem.Refresh;

    DMDRE.QDreOrdem.RecNo := recNo + 1;
  end;
end;

procedure TFDRECad.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  DMDRE.QDreOrdem.Close;
  DMDRE.QDreOrdem.open;
end;

procedure TFDRECad.CadastrodaDRE1Click(Sender: TObject);
begin
  inherited;
  DMDRE.QRDreCadastro.Close;
  DMDRE.QRDreCadastro.Open;

  if FRDRECadastro = nil then
    FRDRECadastro := TFRDRECadastro.Create(Application);
  FRDRECadastro.QRPrimario.Preview
end;

end.
