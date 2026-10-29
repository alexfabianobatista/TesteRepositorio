unit UBoletimOrdemProducao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, ActnList, ImgList, DB, Menus, ComCtrls, StdCtrls,
  Mask, Buttons, ExtCtrls, DBCtrls, Grids, DBGrids, DBDirceu, UFmLote,
  OracleNavigator, DBPanel, UFmProduto;

type
  TFBoletimOrdemProducao = class(TFTCadSimples)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label11: TLabel;
    DBEdit1: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    BtConsFormula: TBitBtn;
    BtConsFilial: TBitBtn;
    DBEdit9: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    BtDepartamentoCons: TBitBtn;
    DBDirceu1: TDBDirceu;
    TabSheet2: TTabSheet;
    Label9: TLabel;
    Label10: TLabel;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBDirceu2: TDBDirceu;
    Opes1: TMenuItem;
    Confirmar2: TMenuItem;
    DBTSituacao: TDBText;
    OrdemdeProduo1: TMenuItem;
    Label12: TLabel;
    DBEdit2: TDBEdit;
    BtConsLoteTipo: TBitBtn;
    DBDirceu3: TDBDirceu;
    Quantidadedeprodutofabricado1: TMenuItem;
    ProjeaodeGastos1: TMenuItem;
    GastosdeMatPrima1: TMenuItem;
    Custodetalhado1: TMenuItem;
    Relao1: TMenuItem;
    EtiquetasdaOrdem1: TMenuItem;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBDirceu4: TDBDirceu;
    DBDirceu5: TDBDirceu;
    Label13: TLabel;
    Label14: TLabel;
    BtConsEnvasador: TBitBtn;
    BtConsControleQualidade: TBitBtn;
    Label15: TLabel;
    DBEdit16: TDBEdit;
    TabSheet3: TTabSheet;
    DBEdit20: TDBEdit;
    OracleNavigator2: TOracleNavigator;
    DBGrid2: TDBGrid;
    Label17: TLabel;
    DBEdit17: TDBEdit;
    Label16: TLabel;
    Matriaprimafaturada1: TMenuItem;
    Label18: TLabel;
    DBEdit18: TDBEdit;
    Label19: TLabel;
    TabSheet4: TTabSheet;
    DBEdit19: TDBEdit;
    BtConsRotulador: TBitBtn;
    DBDirceu6: TDBDirceu;
    DBGrid3: TDBGrid;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    BtAutomatico: TBitBtn;
    DBPanel1: TDBPanel;
    DBPanel2: TDBPanel;
    DBEdit21: TDBEdit;
    Label20: TLabel;
    DBPanel3: TDBPanel;
    DBPanel4: TDBPanel;
    Label21: TLabel;
    DBTTotal: TDBText;
    ComissesporProduo1: TMenuItem;
    ProduoemAberto1: TMenuItem;
    Label22: TLabel;
    DBEdit22: TDBEdit;
    DBEdit23: TDBEdit;
    DBEdit24: TDBEdit;
    DBEdit25: TDBEdit;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    TabSheet5: TTabSheet;
    Label26: TLabel;
    DBEdit26: TDBEdit;
    Label27: TLabel;
    DBEdit27: TDBEdit;
    Label28: TLabel;
    DBEdit28: TDBEdit;
    Label29: TLabel;
    DBEdit29: TDBEdit;
    Label30: TLabel;
    DBEdit30: TDBEdit;
    OracleNavigator1: TOracleNavigator;
    BtLote: TBitBtn;
    EdLote: TEdit;
    DBGrid4: TDBGrid;
    BtProduto: TBitBtn;
    EdProduto: TEdit;
    ProjeodeCompra1: TMenuItem;
    DBRGPercaProduto: TDBRadioGroup;
    procedure FormActivate(Sender: TObject);
    procedure BtConsFormulaClick(Sender: TObject);
    procedure BtDepartamentoConsClick(Sender: TObject);
    procedure BtConsFilialClick(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure Confirmar2Click(Sender: TObject);
    procedure DSPrimarioDataChange(Sender: TObject; Field: TField);
    procedure SBIncluirClick(Sender: TObject);
    procedure OrdemdeProduo1Click(Sender: TObject);
    procedure BtConsLoteTipoClick(Sender: TObject);
    procedure Quantidadedeprodutofabricado1Click(Sender: TObject);
    procedure ProjeaodeGastos1Click(Sender: TObject);
    procedure GastosdeMatPrima1Click(Sender: TObject);
    procedure Custodetalhado1Click(Sender: TObject);
    procedure Relao1Click(Sender: TObject);
    procedure EtiquetasdaOrdem1Click(Sender: TObject);
    procedure BtConsEnvasadorClick(Sender: TObject);
    procedure BtConsControleQualidadeClick(Sender: TObject);
    procedure Matriaprimafaturada1Click(Sender: TObject);
    procedure SBExcluirClick(Sender: TObject);
    procedure BtConsRotuladorClick(Sender: TObject);
    procedure BtAutomaticoClick(Sender: TObject);
    procedure ComissesporProduo1Click(Sender: TObject);
    procedure ProduoemAberto1Click(Sender: TObject);
    procedure OracleNavigator1Click(Sender: TObject;
      Button: TOracleNavigateBtn);
    procedure BtLoteClick(Sender: TObject);
    procedure DBEdit30Exit(Sender: TObject);
    procedure DBEdit28Exit(Sender: TObject);
    procedure BtProdutoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MELocalizaExit(Sender: TObject);
    procedure DBEdit28Enter(Sender: TObject);
    procedure ProjeodeCompra1Click(Sender: TObject);
    procedure SBAlterarClick(Sender: TObject);
    procedure DBGrid4CellClick(Column: TColumn);
    procedure DBRGPercaProdutoClick(Sender: TObject);
    procedure DBRGPercaProdutoExit(Sender: TObject);
    procedure DBEdit7Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FBoletimOrdemProducao: TFBoletimOrdemProducao;


implementation
uses UOracle_cl, UBoletim_cl, UTurno_cl, UFormula_cl, UFormulaCons, UDepartamento_cl,
     UDepartamentoCons, UFilial_cl, UFilialCons, UConfirmaBoletimProducao, UBoletimCons,
     UBoletimParam, UROrdemProducao, UFmFilial, UTipoLote_cl, UTipoLoteCons, UProdutoCons,
     URQtdeProducao, UBoletimCad, URQtdeProducao2, UTela_cl, URBoletim_Relacao,
     UCadastroCons, UCadastro_cl, URMatPrimaFaturada, UParamSistema_cl, UUsuario_cl,
  UCaixaLanc_Cont, UPlanilha_cl, UBiblioteca, URComissoesProducao, UProduto_cl,
  URProducaoEmAberto;

{$R *.dfm}
function A_Set_Darkness(darkness: integer): integer; stdcall; external 'WINPPLA.DLL';
function A_CreatePrn(selection: integer; FileName: pchar): integer; stdcall; external 'WINPPLA.DLL';
function A_Print_Out(width, height, copies, amount: integer): integer; stdcall; external 'WINPPLA.DLL';
function A_Prn_Text(x, y, ori, font, typee, hor_factor, ver_factor: integer; mode: char; numeric: integer; data: pchar): integer; stdcall; external 'WINPPLA.DLL';
function A_Prn_Barcode(x, y, ori: integer; typee: char; narrow, width, height: integer; mode: char; numeric: integer; data: pchar): integer; stdcall; external 'WINPPLA.DLL';
function A_Prn_Text_TrueType(x, y, FSize: integer; FType: pchar; Fspin, FWeight, FItalic, FUnline, FStrikeOut: integer; id_name, data: pchar; mem_mode: integer): integer; stdcall; external 'WINPPLA.DLL';
function A_Get_Graphic(x, y, mem_mode: integer; format: char; filename: pchar): integer; stdcall; external 'WINPPLA.DLL';
function A_Draw_Box(mode, x, y, width, height, top, side: integer): integer; stdcall; external 'WINPPLA.DLL';
function A_Draw_Line(mode, x, y, width, height: integer): integer; stdcall; external 'WINPPLA.DLL';
procedure A_ClosePrn(); stdcall; external 'WINPPLA.DLL';
function A_Load_Graphic(x, y: integer; data: pchar): integer; stdcall; external 'WINPPLA.DLL';
function A_Clear_Memory(): integer; stdcall; external 'WINPPLA.DLL';
function A_Feed_Label():integer;stdcall;external 'WINPPLA.DLL';
function A_GetUSBDeviceInfo(nPort:integer; pDeviceName:PAnsiChar; pDeviceNameLen:PInteger;
              pDevicePath:PAnsiChar; pDevicePathLen:PInteger):integer;stdcall;external 'WINPPLA.DLL';
function  A_EnumUSB(buf:PAnsiChar):integer;stdcall;external 'WINPPLA.DLL';
function  A_GetUSBBufferLen():integer;stdcall;external 'WINPPLA.DLL';
function  A_Set_Backfeed(back:integer):integer;stdcall;external 'WINPPLA.DLL';

procedure TFBoletimOrdemProducao.FormActivate(Sender: TObject);
begin
  inherited;
  MELocaliza.SetFocus;
  PageControl1.ActivePage := TabSheet1;
  FBoletimOrdemProducao.OracleNavigator1.Enabled := False;
  With DMBoletim do
  Begin
    QBoletimProducao.Open;
    QBoletimProducaoitem.Open;
    QBoletimProducaoCusto.Open;
    QPercaProducao.Open;
  End;
  DMTurno.QTurnoAll.Open;
end;

procedure TFBoletimOrdemProducao.BtConsFormulaClick(Sender: TObject);
begin
  inherited;
  If FFormulaCons = Nil then
    FFormulaCons := TFFormulaCons.Create(Application);
  If FFormulaCons.ShowModal = mrOk then
  With DMBoletim,DMFormula do
  begin
    if QFormulaConsIND_SITUACAO.Value = 'DESATIVADA' then
      Raise Exception.Create('Fórmula está desativada. Operação não permitida!');
    QBoletimProducaoCOD_FORMULA.Value := QFormulaConsCod_Formula.Value;
  end;
end;

procedure TFBoletimOrdemProducao.BtDepartamentoConsClick(Sender: TObject);
begin
  inherited;
  If FDepartamentoCons = Nil then
    FDepartamentoCons := TFDepartamentoCons.Create(Application);
  If FDepartamentoCons.ShowModal = MrOk then
  with DMBoletim do
    QBoletimProducaoCOD_DEPARTAMENTO.Value := DMDepartamento.QDepartamentoConsCod_Departamento.Value;
end;

procedure TFBoletimOrdemProducao.BtConsFilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  With DMBoletim do
    QBoletimProducaoCOD_FILIAL.Value := DMFilial.QFilialConsCod_Filial.Value;
end;

procedure TFBoletimOrdemProducao.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  BtConsFormula.Enabled      := DSPrimario.DataSet.State in [dsEdit, dsInsert];
  BtDepartamentoCons.Enabled := DSPrimario.DataSet.State in [dsEdit, dsInsert];
  BtConsFilial.Enabled       := DSPrimario.DataSet.State in [dsEdit, dsInsert];
  BtConsLoteTipo.Enabled     := DSPrimario.DataSet.State in [dsEdit, dsInsert];
  BtAutomatico.Enabled     := DSPrimario.DataSet.State in [dsEdit, dsInsert];
  OracleNavigator1.Enabled := DSPrimario.DataSet.State in [dsEdit, dsInsert];
end;

procedure TFBoletimOrdemProducao.SBConfirmarClick(Sender: TObject);
Var  wCodDoc, wFilial, wCodCompl, wCodHistorico : integer;
    wContaCred, wContaDeb, wNumDoc : String;
    wVlrLancto : Real;
    wDtLancto : TDateTime;
begin
  inherited;
  with DMBoletim do
  begin
    pGerando := True;
    QBoletimProducao.Edit;
    QBoletimProducaoInd_Tipo_Boletim.Value := 'P';
    QBoletimCOD_USUARIO.Value := DmUsuario.CodUsuarioCorrente;
    QBoletimProducao.Post;
    QPercaProducao.close;
    QPercaProducao.SetVariable('COD_BOLETIM',DBEdit1.Text);
    QPercaProducao.Open;
    if (DBEdit28.Text = '') then
      EdProduto.Text := '';
  end;

  if (DMParamSistema.QParamSistemaInd_Contabiliza.Value = 'S') then
  begin
    wCodDoc := DMBoletim.QBoletimProducaoCod_Boletim.Value;
    wNumDoc := FloatToStr(DMBoletim.QBoletimProducaoCod_Boletim.Value) + '-' + Trim(DMBoletim.QBoletimProducaoCod_Formula.Text);
    wFilial := DMBoletim.QBoletimProducaoCod_Filial.Value;
    wCodCompl := DMBoletim.QBoletimProducaoCod_Cadastro_Envasador.Value;
    wVlrLancto := DMBoletim.QBoletimProducaoVal_Custo_Contabil.Value;
    wDtLancto := DMBoletim.QBoletimProducaoDt_Boletim.Value;
    if FCaixa_Lanc_Cont = nil then
      FCaixa_Lanc_Cont := TFCaixa_Lanc_Cont.Create(Application);
    if DMParamSistema.QParamSistemaInd_Tipo_Plano_Conta.Value = 'UNICO' then
      FCaixa_Lanc_Cont.pFilial := 1
    else
      FCaixa_Lanc_Cont.pFilial := wFilial;
    FCaixa_Lanc_Cont.MeFilialDebito.Text := FloatToStr(wFilial);
    FCaixa_Lanc_Cont.MeFilialCredito.Text := FloatToStr(wFilial);
    FCaixa_Lanc_Cont.LbHistorico.Visible := True;
    FCaixa_Lanc_Cont.MeHistorico.Visible := True;
    FCaixa_Lanc_Cont.SbConsHistorico.Visible := True;
    FCaixa_Lanc_Cont.MeHistoricoDescricao.Visible := True;
    FCaixa_Lanc_Cont.ShowModal;
    wContaCred := Bib.LimpaString(FCaixa_Lanc_Cont.MEContaCredito.text, '.');
    wContaDeb := Bib.LimpaString(FCaixa_Lanc_Cont.MEContaDebito.text, '.');
    wCodHistorico := StrToInt(Trim(FCaixa_Lanc_Cont.MeHistorico.Text));
    DMPlanilha.GravaLanc('IND', wCodDoc, wNumDoc, strtoint(FCaixa_Lanc_Cont.MeFilialCredito.Text), wContaCred, 'CREDITO', wCodCompl, wCodHistorico, wVlrlancto, wDTLancto, wContaDeb);
    DMPlanilha.GravaLanc('IND', wCodDoc, wNumDoc, strtoint(FCaixa_Lanc_Cont.MeFilialDebito.Text), wContaDeb, 'DEBITO', wCodCompl, wCodHistorico, wVlrlancto, wDTLancto, wContaCred);
  end;

  DMOracle.DBCemapa.Commit;
end;

procedure TFBoletimOrdemProducao.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FBoletimCons = Nil then
    FBoletimCons := TFBoletimCons.Create(Application);
  If FBoletimCons.ShowModal = mrOk then
  With DMBoletim do
  Begin
    QBoletimProducao.Close;
    QBoletimProducao.SetVariable('PK',QBoletimConsCod_Boletim.Value);
    QBoletimProducao.Open;
    QBoletimProducaoCusto.Close;
    QBoletimProducaoCusto.Open;
    QPercaProducao.close;
    QPercaProducao.SetVariable('COD_BOLETIM',QBoletimConsCOD_BOLETIM.Value);
    QPercaProducao.Open;
    if (DMParamSistema.QParamSistemaIND_CONTROLA_PERCA_PRODUCAO.Value = 'SIM') then
    begin
      DBEdit28Exit(Sender);
      DBEdit30Exit(Sender);
      if (QBoletimProducaoIND_SITUACAO.Value = '2') then
        FBoletimOrdemProducao.OracleNavigator1.Enabled := False;
    end;
  End;
end;

procedure TFBoletimOrdemProducao.Confirmar2Click(Sender: TObject);
begin
  inherited;
  if Trim(DMBoletim.QBoletimProducaoCOD_BOLETIM.Text) <> '' then
  begin
    if FConfirmaBoletimProducao = Nil then
       FConfirmaBoletimProducao := TFConfirmaBoletimProducao.Create(Application);
    DMTela.VerificaTela('INDUSTRIA',FConfirmaBoletimProducao.Caption,FConfirmaBoletimProducao.Name);
    FConfirmaBoletimProducao.ShowModal;
  end
  else
    raise Exception.Create('Informe o boletim de produção para confirmar.');
end;

procedure TFBoletimOrdemProducao.DSPrimarioDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  with DMBoletim.QBoletimProducaoIND_SITUACAO do
    if Value = SIT_BOLETIM_DIGITADA then
      DBTSituacao.Font.Color := clRed
    else if (Value = SIT_BOLETIM_CONFIRMADA) then
      DBTSituacao.Font.Color := clGreen
    else if Value = SIT_BOLETIM_PARCIAL then
      DBTSituacao.Font.Color := clBlue
    else
      DBTSituacao.Font.Color := clWindowText;
end;

procedure TFBoletimOrdemProducao.SBIncluirClick(Sender: TObject);
begin
  inherited;
  PageControl1.ActivePage := TabSheet1;
  DMBoletim.QPercaProducao.Open;
  DMBoletim.QPercaProducao.Close;
  if DMParamSistema.CodEmpresa = 'JPFERRAGEM' then
    DBEdit2.Text := '1';
end;

procedure TFBoletimOrdemProducao.OrdemdeProduo1Click(Sender: TObject);
begin
  inherited;
  //if FBoletimParam = Nil then
//     FBoletimParam := TFBoletimParam.Create(Application);
//  FBoletimParam.PGRelatorio.Pages[7].TabVisible := True;
//  if FBoletimParam.ShowModal = mrOk then
  with DMBoletim do
  begin
    QRBoletimOrdemProducao.Close;
    if (DBEdit1.Text = '') then
      raise Exception.Create('Selecione uma ordem de produção.');

    //if Trim(FBoletimParam.FMFilial7.MeFilial.Text) = '' then
//      QRBoletimOrdemProducao.SetVariable('COD_FILIAL',Null)
//    else
//      QRBoletimOrdemProducao.SetVariable('COD_FILIAL',FBoletimParam.FMFilial7.MEFilial.Text);
//    if Trim(FBoletimParam.MeFormula7.Text) = '' then
//       QRBoletimOrdemProducao.SetVariable('COD_FORMULA',Null)
//    else
//       QRBoletimOrdemProducao.SetVariable('COD_FORMULA',FBoletimParam.MeFormula7.Text);
    QRBoletimOrdemProducao.SetVariable('COD_ORDEM_PRODUCAO', QBoletimProducaoCOD_BOLETIM.Value);
    QRBoletimOrdemProducao.Open;

    if FROrdemProducao = nil then
      FROrdemProducao := TFROrdemProducao.Create(Application);
    FROrdemProducao.QRLNomeRel.Caption := 'FRordemProducao';
    //If FBoletimParam.RGPreview.ItemIndex = 0 then
    FROrdemProducao.QRPrimario.Preview;
//    else
//      FROrdemProducao.QRPrimario.Print;
    FROrdemProducao.Close;
  end;
end;

procedure TFBoletimOrdemProducao.BtConsLoteTipoClick(Sender: TObject);
begin
  inherited;
  If FTipoLoteCons = Nil then
    FTipoLoteCons := TFTipoLoteCons.Create(Application);
  If FTipoLoteCons.ShowModal = MrOk then
  with DMBoletim do
    QBoletimProducaoCOD_LOTE_TIPO.Value := DMTipoLote.QTipoLoteConsCOD_LOTE_TIPO.Value;
end;

procedure TFBoletimOrdemProducao.Quantidadedeprodutofabricado1Click(
  Sender: TObject);
begin
  inherited;
  if FBoletimParam = Nil then
     FBoletimParam := TFBoletimParam.Create(Application);
  FBoletimParam.PGRelatorio.Pages[8].TabVisible := True;
  if FBoletimParam.ShowModal = mrOk then
  with DMBoletim do
  begin
    QRQtdProducao.Close;
    QRQtdProducao2.Close;
    if Trim(FBoletimParam.MEFilial8.Text) <> '' then
    begin
      QRQtdProducao.SetVariable('FILIAL',FBoletimParam.MEFilial8.Text);
      QRQtdProducao2.SetVariable('FILIAL',FBoletimParam.MEFilial8.Text);
    end
    else
      raise Exception.Create('É necessário informar a Filial');

    if (trim(FBoletimParam.MeDtInicial8.Text) <> '') and (trim(FBoletimParam.MeDtFinal8.Text) <> '') then
    begin
      QRQtdProducao.SetVariable('DATA_I',StrToDate(FBoletimParam.MeDtInicial8.Text));
      QRQtdProducao.SetVariable('DATA_F',StrToDate(FBoletimParam.MEDtFinal8.Text));
      QRQtdProducao2.SetVariable('DATA_I',StrToDate(FBoletimParam.MeDtInicial8.Text));
      QRQtdProducao2.SetVariable('DATA_F',StrToDate(FBoletimParam.MEDtFinal8.Text));
    end
    else
      raise Exception.Create('É necessário informar a Data');
      
    If Trim(FBoletimParam.METurno8.Text) = '' Then
    Begin
      QRQtdProducao.SetVariable('TURNO',Null);
      QRQtdProducao2.SetVariable('TURNO',Null);
    end
    else
    begin
      QRQtdProducao.SetVariable('TURNO',FBoletimParam.METurno8.Text);
      QRQtdProducao2.SetVariable('TURNO',FBoletimParam.METurno8.Text);
    end;

    if (Trim(FBoletimParam.fmdepartamento8.MeDepartamento.Text) <> '') then
    begin
       QRQtdProducao.SetVariable('DEPARTAMENTO', trim(FBoletimParam.FmDepartamento8.MeDepartamento.Text));
      QRQtdProducao2.SetVariable('DEPARTAMENTO', trim(FBoletimParam.FmDepartamento8.MeDepartamento.Text));
    end
    else
    begin
       QRQtdProducao.SetVariable('DEPARTAMENTO', null);
      QRQtdProducao2.SetVariable('DEPARTAMENTO', null);
    end;

    QRQtdProducao.Open;
    QRQtdProducao2.Open;

    if FRQtdeProducao = nil then
       FRQtdeProducao := TFRQtdeProducao.Create(Application);
    FRQtdeProducao.QRLTitulo.Caption := 'Rel. da Producao de '+FBoletimParam.MeDtInicial8.Text + ' até '+FBoletimParam.MeDtFinal8.Text;
      if FRQtdeProducao2 = nil then
      FRQtdeProducao2 := TFRQtdeProducao2.Create(Application);
    FRQtdeProducao2.QRLTitulo.Caption := 'Rel. da Producao de '+FBoletimParam.MeDtInicial8.Text + ' até '+FBoletimParam.MeDtFinal8.Text;
    
    if FBoletimParam.RGPreview.ItemIndex = 0 then
       FRQtdeProducao.QRCompositeReport1.Preview
    else
       FRQtdeProducao.QRCompositeReport1.Print;

    QRQtdProducao.Close;
    QRQtdProducao2.Close;
  end;
  
end;

procedure TFBoletimOrdemProducao.ProjeaodeGastos1Click(Sender: TObject);
begin
  inherited;
  FBoletimCad.ProjeodeGastos1Click(Sender);
end;

procedure TFBoletimOrdemProducao.GastosdeMatPrima1Click(Sender: TObject);
begin
  inherited;
  FBoletimCad.GastosdeMatPrima1Click(Sender);
end;

procedure TFBoletimOrdemProducao.Custodetalhado1Click(Sender: TObject);
begin
  inherited;
  FBoletimCad.Custodetalhado1Click(Sender);
end;

procedure TFBoletimOrdemProducao.Relao1Click(Sender: TObject);
var wtitulo : String;
begin
  inherited;
  if FBoletimParam = Nil then
     FBoletimParam := TFBoletimParam.Create(Application);
  FBoletimParam.PGRelatorio.Pages[2].TabVisible := True;
  if FBoletimParam.ShowModal = mrOk then
  with DMBoletim do
  begin
    QRRelacao.Close;
    QRRelacao.SetVariable('DATA_I',StrToDate(FBoletimParam.ME2DataI.Text));
    QRRelacao.SetVariable('DATA_F',StrToDate(FBoletimParam.ME2DataF.Text));
    if Trim(FBoletimParam.ME2Filial.Text) = '' then
      QRRelacao.SetVariable('FILIAL',Null)
    else
      QRRelacao.SetVariable('FILIAL',FBoletimParam.ME2Filial.Text);
    if Trim(FBoletimParam.ME2Turno.Text) = '' then
       QRRelacao.SetVariable('TURNO',Null)
    else
       QRRelacao.SetVariable('TURNO',FBoletimParam.ME2Turno.Text);
    if Trim(FBoletimParam.FM2Departamento.MeDepartamento.Text) = '' then
       QRRelacao.SetVariable('COD_DEPARTAMENTO',Null)
    else
       QRRelacao.SetVariable('COD_DEPARTAMENTO',FBoletimParam.FM2Departamento.MeDepartamento.Text);
    if trim(FBoletimParam.fmProduto1.MeProduto.Text) = '' then
      QRRelacao.SetVariable('PRODUTO', null)
    else
      QRRelacao.SetVariable('PRODUTO', trim(FBoletimParam.fmProduto1.MeProduto.Text));
   {Classe/SubClasse}
    if Trim(FBoletimParam.FmSubClasse2.MeClasse.Text) = '' then
      QRRelacao.SetVariable('NUM_CLASSE', Null)
    else
      QRRelacao.SetVariable('NUM_CLASSE', FBoletimParam.FmSubClasse2.MeClasse.Text);
    if (Trim(FBoletimParam.FmSubClasse2.MeSubClasse.Text) = '') or
        (Trim(FBoletimParam.FmSubClasse2.MeSubClasse.Text) = '0') then
      QRRelacao.SetVariable('SUBCLASSE', Null)
    else
      QRRelacao.SetVariable('SUBCLASSE', FBoletimParam.FmSubClasse2.MeSubClasse.Text);

    if trim(FBoletimParam.meFormula.Text) = '' then
      QRRelacao.SetVariable('FORMULA', null)
    else
      QRRelacao.SetVariable('FORMULA', trim(FBoletimParam.meFormula.Text));

   //Envasador
    if trim(FBoletimParam.FmEnvasador2.MeCadastro.Text) = '' then
      QRRelacao.SetVariable('COD_CADASTRO_ENVASADOR', null)
    else
      QRRelacao.SetVariable('COD_CADASTRO_ENVASADOR', trim(FBoletimParam.FmEnvasador2.MeCadastro.Text));

   //Rotulador
    if trim(FBoletimParam.FmRotulador2.MeCadastro.Text) = '' then
      QRRelacao.SetVariable('COD_CADASTRO_ROTULADOR', null)
    else
      QRRelacao.SetVariable('COD_CADASTRO_ROTULADOR', trim(FBoletimParam.FmRotulador2.MeCadastro.Text));

    //Lote
    if trim(FBoletimParam.Fm2Lote.MeLote.Text) = '' then
      QRRelacao.SetVariable('LOTE', null)
    else
      QRRelacao.SetVariable('LOTE', trim(FBoletimParam.Fm2Lote.MeLote.Text));

    // Traz apenas os boletins confirmados
    QRRelacao.SetVariable('SITUACAO', 'TB_BOLETIM.IND_SITUACAO = 2');

    // Materia prima
    if FBoletimParam.Rg2TipoBoletim.ItemIndex = 0 Then
    begin
      QRRelacao.SetVariable('TIPO_BOLETIM','M');
//      QRRelacao.SQL[QRRelacao.SQL.Count-1]:='';  // elimina a última Linha da SQL
//      QRRelacao.SQL.Add(' AND TB_BOLETIM.QT_FABRICADO < 0 ORDER BY TB_BOLETIM.DT_BOLETIM, TB_BOLETIM.COD_BOLETIM');
      wTitulo := 'Boletim de Industrialização Materia Prima de '
    end
    else  // Produto acabado
    begin
      QRRelacao.SetVariable('TIPO_BOLETIM','P');
//      QRRelacao.SQL[QRRelacao.SQL.Count-1]:='';  // elimina a última Linha da SQL
//      QRRelacao.SQL.Add(' AND TB_BOLETIM.QT_FABRICADO >= 0 ORDER BY TB_BOLETIM.DT_BOLETIM, TB_BOLETIM.COD_BOLETIM');
      wTitulo := 'Boletim de Industrialização Produto Acabado de '
    end;

    if FBoletimParam.CB2Ordem.Text = 'Controle' then
      QRRelacao.SetVariable('ORDEM', 'ORDER BY NUM_CONTROLE ASC')
    else
      if FBoletimParam.CB2Ordem.Text = 'Boletim' then
        QRRelacao.SetVariable('ORDEM', 'ORDER BY COD_BOLETIM ASC')
      else
        if FBoletimParam.CB2Ordem.Text = 'Data' then
          QRRelacao.SetVariable('ORDEM', 'ORDER BY DT_BOLETIM ASC');

    QRRelacao.Open;
    if FRBoletim_Relacao = nil then
      FRBoletim_Relacao := TFRBoletim_Relacao.Create(Application);
    FRBoletim_Relacao.QRLTitulo.Caption := wTitulo +FBoletimParam.ME2DataI.Text
                                           +' até '+FBoletimParam.ME2DataF.Text;
    FRBoletim_Relacao.QRLDepartamento.Caption := 'Departamento:'+FBoletimParam.FM2Departamento.EdDepartamento.Text;
    FRBoletim_Relacao.qrlenvasador.Caption := 'Envasador: ' +FBoletimParam.FmEnvasador2.EdCadastro.Text;
    If FBoletimParam.RGPreview.ItemIndex = 0 then
      FRBoletim_Relacao.QRPrimario.Preview
    else
      FRBoletim_Relacao.QRPrimario.Print;
    QRRelacao.Close;
//    QRRelacao.SQL[QRRelacao.SQL.Count-1]:='';
  end;
end;

procedure TFBoletimOrdemProducao.EtiquetasdaOrdem1Click(Sender: TObject);
var
  ret,nLen : integer;
  pbuf : array[0..127] of AnsiChar;
  ver : PAnsiChar;
  strmsg : string;
  len1,len2 : integer;
  buf1,buf2 : AnsiString;
  buff1 : array[0..127] of WideChar;
  wCont : integer;
  wLote,wCodBarra, wCQ, wEnvasador, wCodProduto : string;
begin
  inherited;
  wCont := 0;
  with DMBoletim do
  Begin
    if FBoletimParam = Nil then
      FBoletimParam := TFBoletimParam.Create(Application);
    FBoletimParam.PGRelatorio.Pages[9].TabVisible := True;
    if FBoletimParam.ShowModal = mrOk then
    begin
        QBoletim.Close;
      QBoletim.SetVariable('PK',Trim(FBoletimParam.MEOrdem9.Text));
      QBoletim.Open;
      wLote := DMOracle.BuscaNome('SELECT DESC_LOTE FROM TB_LOTE_TIPO ',' COD_LOTE_TIPO ='+QBoletimCOD_LOTE_TIPO.Text);
      wCodBarra := FormatFloat('000000',StrToInt(DMOracle.BuscaNome('SELECT COD_PRODUTO FROM TB_FORMULA',' COD_FORMULA ='+QBoletimCOD_FORMULA.Text)))+
                   FormatFloat('000000',QBoletimCOD_LOTE_TIPO.Value);
      wEnvasador := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO='+QBoletimCOD_CADASTRO_ENVASADOR.Text);
      wCQ := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO='+QBoletimCOD_CADASTRO_CQ.Text);
      wCodProduto := DMOracle.BuscaNome('SELECT COD_PRODUTO FROM TB_FORMULA',' COD_FORMULA ='+QBoletimCOD_FORMULA.Text);
      nLen := A_GetUSBBufferLen() + 1;
      len1 := 128;
      len2 := 128;
      SetLength(buf1,len1);
      SetLength(buf2,len2);
      A_EnumUSB(pbuf);
      A_GetUSBDeviceInfo(1, PAnsiChar(buf1), @len1, PAnsiChar(buf2), @len2);
      ret := A_CreatePrn(12, PAnsiChar(buf2));   // open usb.
      A_Set_Darkness(12);
      while QBoletimQT_FABRICADO.Value > wCont do
      Begin
    //function A_Prn_Text_TrueType(x, y, FSize: integer; FType: pchar; Fspin, FWeight, FItalic, FUnline, FStrikeOut: integer; id_name, data: pchar; mem_mode: integer): integer; stdcall; external 'WINPPLA.DLL';

        //A_Prn_Text_TrueType(045, 110, 35, 'Arial', 1, 0, 0, 0, 0, 'A21',  pchar('Aprovado CQ:'+ wCQ), 1);
        //A_Prn_Text(050, 200, 1, 2, 0, 1, 2, 'n', 2, pchar('Produto:'+QBoletimnome_formula.Text));
        //A_Prn_Text(050, 170, 1, 2, 0, 1, 2, 'n', 2, pchar('Lote:'+wLote));
        //A_Prn_Text_TrueType(045, 140, 35, 'Arial', 1, 0, 0, 0, 0, 'A2', pchar('Nome Envasador:'+ wEnvasador), 1);
        //Adicionado o Cod_produto - Solicitado por Marcos. - Junior 29/03/2019 wCodProduto A1, A11
//        A_Prn_Text_TrueType(030, 170, 35, 'Arial',1, 0, 0, 0, 0, 'A1', pchar('Produto:'+wCodProduto+'-'+copy(QBoletimnome_formula.Text,1,30)), 1);
        A_Prn_Text(030, 160, 1, 2, 0, 1, 2, 'n', 2, pchar('Produto:'+wCodProduto+'-'+copy(QBoletimnome_formula.Text,1,40)));
//        A_Prn_Text_TrueType(030, 147, 35, 'Arial', 1, 0, 0, 0, 0, 'A11', pchar('Lote: '+wLote), 1);
        A_Prn_Text(030, 135, 1, 2, 0, 1, 2, 'n', 2, pchar('Lote: '+wLote));
        A_Prn_Text(030, 115, 1, 2, 0, 1, 2, 'n', 2, pchar('Nome Envasador: '+ wEnvasador));
        A_Prn_Text(030, 095, 1, 2, 0, 1, 2, 'n', 2, pchar('Aprovado CQ: '+ wCQ));
        A_Prn_Barcode(150, 025, 1, 'D', 0, 0, 45, 'N', 0, pchar(wCodBarra)); 
        A_Set_Backfeed(320);
        A_Print_Out(1, 1, 1, 1);
        inc(wCont);
      end;
      A_ClosePrn;
    end
    else
      Exit;
  end;
end;

procedure TFBoletimOrdemProducao.BtConsEnvasadorClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
  With DMBoletim do
    QBoletimProducaoCOD_CADASTRO_ENVASADOR.Value := dmcadastro.qcadastroConsCOD_CADASTRO.Value;
end;

procedure TFBoletimOrdemProducao.BtConsControleQualidadeClick(
  Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
  With DMBoletim do
    QBoletimProducaoCOD_CADASTRO_CQ.Value := dmcadastro.qcadastroConsCOD_CADASTRO.Value;
end;

procedure TFBoletimOrdemProducao.Matriaprimafaturada1Click(
  Sender: TObject);
begin
  inherited;
  if FBoletimParam = Nil then
     FBoletimParam := TFBoletimParam.Create(Application);
  FBoletimParam.PGRelatorio.Pages[10].TabVisible := True;
  if FBoletimParam.ShowModal = mrOk then
  with DMBoletim do
  begin
    QRMtFaturada.Close;
    if Trim(FBoletimParam.Fm10Datas.MeDtInicial.Text) <> '' then
      QRMtFaturada.SetVariable('DATA_I',StrToDate(FBoletimParam.Fm10Datas.MeDtInicial.Text))
    else
      raise Exception.Create('Necessário informar as datas');
    if Trim(FBoletimParam.Fm10Datas.MeDtFinal.Text) <> '' then
      QRMtFaturada.SetVariable('DATA_F',StrToDate(FBoletimParam.Fm10Datas.MeDtFinal.Text))
    else
      raise Exception.Create('Necessário informar as datas');
      
    if Trim(FBoletimParam.Fm10Filial.MeFilial.Text) = '' then
      QRMtFaturada.SetVariable('COD_FILIAL',Null)
    else
      QRMtFaturada.SetVariable('COD_FILIAL',FBoletimParam.Fm10Filial.MeFilial.Text);
    QRMtFaturada.Open;
    if FRMatPrimaFaturada = nil then
      FRMatPrimaFaturada := TFRMatPrimaFaturada.Create(Application);

    FRMatPrimaFaturada.QRLPeriodo.Caption := 'Período: ' + Trim(FBoletimParam.Fm10Datas.MeDtInicial.Text) +
                                             ' até ' + Trim(FBoletimParam.Fm10Datas.MeDtFinal.Text); 
    If FBoletimParam.RGPreview.ItemIndex = 0 then
      FRMatPrimaFaturada.QRPrimario.Preview
    else
      FRMatPrimaFaturada.QRPrimario.Print;
    QRMtFaturada.Close;
  end;
end;

procedure TFBoletimOrdemProducao.SBExcluirClick(Sender: TObject);
var wNumDoc : integer;
begin
  wNumDoc := DMBoletim.QBoletimProducaoCod_Boletim.Value;  // salvar o codigo do boletim para excluir na contabilidade
  inherited;
  if DMOracle.DBCemapa.InTransaction = false then
    DMOracle.DBCemapa.StartTransaction;
  try
    DMPlanilha.Descontabiliza(wNumDoc, 'IND');
    //exclui cadastro de movimento de custo de veículo - PMC 31/03/2004
{Para excluir os lançamentos que existirem na TB_PERCA_PRODUCAO.}
    DMOracle.QExecSQL.Close;
    DMOracle.QExecSQL.SQL.Clear;
    DMOracle.QExecSQL.SQL.Add('DELETE FROM TB_PERCA_PRODUCAO WHERE COD_BOLETIM = ' + IntToStr(wNumDoc) );
    DMOracle.QExecSQL.Open;
{Fim}
    DMOracle.DBCemapa.Commit;
  except
    DMOracle.DBCemapa.RollBack;
  end;
  DMBoletim.QPercaProducao.Open;
  DMBoletim.QPercaProducao.Close;
end;

procedure TFBoletimOrdemProducao.BtConsRotuladorClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
  With DMBoletim do
    QBoletimProducaoCOD_CADASTRO_ROTULADOR.Value := dmcadastro.qcadastroConsCOD_CADASTRO.Value;
end;

procedure TFBoletimOrdemProducao.BtAutomaticoClick(Sender: TObject);
var
  wProd : string;
begin
  inherited;
  //----------------------------------------------------------------------------
  //  Gian 02/04/2019, solicitado por João Paulo da Deion
  //  Aba comissões de produção.
  //----------------------------------------------------------------------------
  if MessageBox (Application.Handle,
                Pchar('Você irá limpar as comissões atuais e adiciona-las novamente com seus padrões'),
                'Exclusao de arquivo', MB_YESNO+MB_DEFBUTTON2) = idYes then
  begin
    with DMBoletim do
    begin
      QBoletimProducaoComissao.Open;
      QBoletimProducaoComissao.First;
      
      while not QBoletimProducaoComissao.Eof do
      begin
        QBoletimProducaoComissao.Delete;
      end;

      QBoletimProducaoItem.First;
      while not QBoletimProducaoItem.Eof do
      begin
        wProd := DMOracle.FastSelect('PERC_COMISSAO_PRODUCAO','TB_PRODUTO','COD_PRODUTO = ' + QBoletimProducaoItemCOD_PRODUTO.Text);
        QBoletimProducaoComissao.Append;
        QBoletimProducaoComissaoCOD_BOLETIM.Value := QBoletimProducaoCOD_BOLETIM.Value;
        if wProd <> '' then
          QBoletimProducaoComissaoPERC_COMISSAO.Value := StrToFloat(wProd)
        else
          QBoletimProducaoComissaoPERC_COMISSAO.Value := 0;
        QBoletimProducaoComissaoCOD_PRODUTO.Value := QBoletimProducaoItemCOD_PRODUTO.Value;
        QBoletimProducaoComissaoQT_QUANTIDADE.Value := QBoletimProducaoItemQT_USADA.Value;
        QBoletimProducaoItem.Next;
      end; 

      QBoletimProducaoComissao.Post;

    end;
  end;
end;

procedure TFBoletimOrdemProducao.ComissesporProduo1Click(Sender: TObject);
begin
  inherited;
  //----------------------------------------------------------------------------
  //  Gian 02/04/2019, solicitado por João Paulo da Deion
  //  Aba comissões de produção.
  //----------------------------------------------------------------------------
  if FBoletimParam = Nil then
     FBoletimParam := TFBoletimParam.Create(Application);
  FBoletimParam.PGRelatorio.Pages[11].TabVisible := True;
  if FBoletimParam.ShowModal = mrOk then
  begin
    if (Trim(FBoletimParam.Me12DtInicial.Text) = '') or
        (Trim(FBoletimParam.Me12DtFinal.Text) = '') then
      raise Exception.Create('Informe um intervalo de datas!');
    with DMBoletim do
    begin
      QRComissoesProducao.Close;
      Bib.setVariableOuNull(QRComissoesProducao, 'COD_BOLETIM', Trim(FBoletimParam.ME12OrdemProducao.Text));
      Bib.setVariableOuNull(QRComissoesProducao, 'COD_ENVASADOR', Trim(FBoletimParam.Fm12Envasador.MeCadastro.Text));
      Bib.setVariableOuNull(QRComissoesProducao, 'COD_FILIAL', Trim(FBoletimParam.Fm12Filial.MeFilial.Text));
      Bib.setVariableOuNull(QRComissoesProducao, 'DT_INICIAL', Trim(FBoletimParam.Me12DtInicial.Text));
      Bib.setVariableOuNull(QRComissoesProducao, 'DT_FINAL', Trim(FBoletimParam.Me12DtFinal.Text));
      QRComissoesProducao.Open;

      if FRComissaoProducao = nil then
        FRComissaoProducao := TFRComissaoProducao.Create(Application);

      if Trim(FBoletimParam.Fm12Filial.MeFilial.Text) = '' then
        FRComissaoProducao.QRLEmpresa.Caption := 'Filial: Todas'
      else
        FRComissaoProducao.QRLEmpresa.Caption := 'Filial: ' + DMOracle.FastSelect('COD_FILIAL','TB_FILIAL','COD_FILIAL = ' + Trim(FBoletimParam.Fm12Filial.MeFilial.Text));
        
      If FBoletimParam.RGPreview.ItemIndex = 0 then
        FRComissaoProducao.QRPrimario.Preview
      else
        FRComissaoProducao.QRPrimario.Print;
    end;
  end;
end;

procedure TFBoletimOrdemProducao.ProduoemAberto1Click(Sender: TObject);
begin
  inherited;
  if FBoletimParam = Nil then
     FBoletimParam := TFBoletimParam.Create(Application);
  FBoletimParam.PGRelatorio.Pages[12].TabVisible := True;
  if FBoletimParam.ShowModal = mrOk then
  begin
    with DMBoletim do
    begin
      QRBoletimProducaoEmAberto.Close;
      Bib.setVariableOuNull(QRBoletimProducaoEmAberto, 'CADASTRO', Trim(FBoletimParam.Fm13Cadastro.MeCadastro.Text));
      QRBoletimProducaoEmAberto.Open;
    end;

   if FRProducaoEmAberto = nil then
      FRProducaoEmAberto := TFRProducaoEmAberto.Create(Application);
    FRProducaoEmAberto.QRLTitulo.Caption := 'Relatório: ' + FRProducaoEmAberto.Caption;
    FRProducaoEmAberto.QRPrimario.Preview;
  end;
end;

procedure TFBoletimOrdemProducao.OracleNavigator1Click(Sender: TObject;
  Button: TOracleNavigateBtn);
begin
  inherited;
  if Button = nbInsert then
  begin
    DBEdit28.SetFocus;
    DBEdit27.Text := dmboletim.QBoletimProducaoCOD_BOLETIM.Text;
    DBRGPercaProduto.ItemIndex := 1;
  end;
end;

procedure TFBoletimOrdemProducao.BtLoteClick(Sender: TObject);
begin
  inherited;
  If FTipoLoteCons = Nil then
    FTipoLoteCons := TFTipoLoteCons.Create(Application);
  If FTipoLoteCons.ShowModal = mrOk then
  begin
    DBEdit30.Text := DMTipoLote.QTipoLoteConsCod_Lote_Tipo.Text;
    DBEdit30Exit(self);
  end;
end;

procedure TFBoletimOrdemProducao.DBEdit30Exit(Sender: TObject);
begin
  inherited;
  If Trim(DBEdit30.Text) <> '' Then
     EdLote.Text :=DMOracle.BuscaNome('SELECT DESC_LOTE FROM TB_LOTE_TIPO',
                        'COD_LOTE_TIPO = '+DBEdit30.text,True)
  Else
    EdLote.text := 'Todos';
end;

procedure TFBoletimOrdemProducao.DBEdit28Exit(Sender: TObject);
var
 wProduto, wDescProduto: string;
begin
  inherited;
  With DMBoletim do
  begin
    if (DBEdit28.Text <> '') and (DBRGPercaProduto.ItemIndex = 1) then
    begin
      wProduto := '';
      wProduto := DMOracle.FastSelect('COD_PRODUTO','TB_BOLETIM_ITEM','COD_PRODUTO = ' + DBEdit28.Text + ' AND COD_BOLETIM = ' + DBEdit27.Text);
      EdProduto.Text := DMOracle.FastSelect('DESC_PRODUTO','TB_PRODUTO','COD_PRODUTO = ' + QuotedStr(wProduto));
      if (Trim(DBEdit28.Text) <> wProduto) then
      begin
        DBEdit28.SetFocus;
        Raise Exception.Create('O produto informado não consta neste boletim');
      end;
    end
    else if (DBEdit28.Text <> '') and (DBRGPercaProduto.ItemIndex = 0) then
      EdProduto.Text := DMOracle.FastSelect('DESC_PRODUTO','TB_PRODUTO','COD_PRODUTO = ' + DBEdit28.Text)
    else
      EdProduto.Text := '';
  end;
end;

procedure TFBoletimOrdemProducao.BtProdutoClick(Sender: TObject);
begin
  inherited;
  if FProdutoCons = Nil then
   FProdutoCons := TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = MrOk then
  begin
    DBEdit28.Text := DMProduto.QProdutoConsCOD_PRODUTO.Text;
    EdProduto.Text := DMProduto.QProdutoConsDESC_PRODUTO.Text;
    DBEdit28Exit(Self);
  end;
end;

procedure TFBoletimOrdemProducao.FormCreate(Sender: TObject);
begin
  inherited;
  OracleNavigator1.Enabled := False;
  if (DMParamSistema.QParamSistemaIND_CONTROLA_PERCA_PRODUCAO.Value = 'NAO') then
    TabSheet5.TabVisible := false;
  if (DMParamSistema.CodEmpresa = 'PERTUTTI') then
  begin
    TabSheet3.TabVisible := false;
    TabSheet4.TabVisible := false;
    Label13.Visible := False;
    Label14.Visible := False;
    Label19.Visible := False;
    Label15.Visible := False;
    Label18.Visible := False;
    Label22.Visible := False;
    Label23.Visible := False;
    Label24.Visible := False;
    Label25.Visible := False;
    Label5.Visible := False;
    DBEdit14.Enabled := False;
    DBEdit14.Visible := False;
    DBDirceu4.Enabled := False;
    DBDirceu4.Visible := False;
    BtConsENvasador.Enabled := False;
    BtConsEnvasador.Visible := False;
    DBEdit15.Enabled := False;
    DBEdit15.Visible := False;
    DBDirceu5.Enabled := False;
    DBDirceu5.Visible := False;
    BtConsControleQualidade.Enabled := False;
    BtConsControleQualidade.Visible := False;
    DBEdit19.Enabled := False;
    DBEdit19.Visible := False;
    DBDirceu6.Enabled := False;
    DBDirceu6.Visible := False;
    BtConsRotulador.Enabled := False;
    BtConsRotulador.Visible := False;
    DBEdit14.Enabled := False;
    DBEdit14.Visible := False;
    DBDirceu4.Enabled := False;
    DBDirceu4.Visible := False;
    BtConsENvasador.Enabled := False;
    BtConsEnvasador.Visible := False;
    DBEdit16.Enabled := False;
    DBEdit16.Visible := False;
    DBEdit18.Enabled := False;
    DBEdit18.Visible := False;
    DBEdit22.Enabled := False;
    DBEdit22.Visible := False;
    DBEdit23.Enabled := False;
    DBEdit23.Visible := False;
    DBEdit24.Enabled := False;
    DBEdit24.Visible := False;
    DBEdit25.Enabled := False;
    DBEdit25.Visible := False;
    DBEdit5.Enabled := False;
    DBEdit5.Visible := False;
    TabSheet3.TabVisible := False;
    TabSheet4.TabVisible := False;
  end;
  if (DMParamSistema.CodEmpresa = 'PEPITA') then
  begin
    TabSheet4.TabVisible := false;
    Label13.Visible := False;
    Label14.Visible := False;
    Label19.Visible := False;
    Label15.Visible := False;
    Label18.Visible := False;
    Label22.Visible := False;
    Label23.Visible := False;
    Label24.Visible := False;
    Label25.Visible := False;
    Label5.Visible := False;
    DBEdit14.Enabled := False;
    DBEdit14.Visible := False;
    DBDirceu4.Enabled := False;
    DBDirceu4.Visible := False;
    BtConsENvasador.Enabled := False;
    BtConsEnvasador.Visible := False;
    DBEdit15.Enabled := False;
    DBEdit15.Visible := False;
    DBDirceu5.Enabled := False;
    DBDirceu5.Visible := False;
    BtConsControleQualidade.Enabled := False;
    BtConsControleQualidade.Visible := False;
    DBEdit19.Enabled := False;
    DBEdit19.Visible := False;
    DBDirceu6.Enabled := False;
    DBDirceu6.Visible := False;
    BtConsRotulador.Enabled := False;
    BtConsRotulador.Visible := False;
    DBEdit14.Enabled := False;
    DBEdit14.Visible := False;
    DBDirceu4.Enabled := False;
    DBDirceu4.Visible := False;
    BtConsENvasador.Enabled := False;
    BtConsEnvasador.Visible := False;
    DBEdit16.Enabled := False;
    DBEdit16.Visible := False;
    DBEdit18.Enabled := False;
    DBEdit18.Visible := False;
    DBEdit22.Enabled := False;
    DBEdit22.Visible := False;
    DBEdit23.Enabled := False;
    DBEdit23.Visible := False;
    DBEdit24.Enabled := False;
    DBEdit24.Visible := False;
    DBEdit25.Enabled := False;
    DBEdit25.Visible := False;
    DBEdit5.Enabled := False;
    DBEdit5.Visible := False;
    TabSheet4.TabVisible := False;
  end;
end;

procedure TFBoletimOrdemProducao.MELocalizaExit(Sender: TObject);
begin
  inherited;
  With DMBoletim, DMParamSistema do
  Begin
    QPercaProducao.close;
    QPercaProducao.SetVariable('COD_BOLETIM',QBoletimProducaoCOD_BOLETIM.Value);
    QPercaProducao.Open;
    if (QParamSistemaIND_CONTROLA_PERCA_PRODUCAO.Value = 'SIM') then
    begin
      DBEdit28Exit(Sender);
      DBEdit30Exit(Sender);
      if (QBoletimProducaoIND_SITUACAO.Value = '2') then
        FBoletimOrdemProducao.OracleNavigator1.Enabled := False;
    end;
  End;
end;

procedure TFBoletimOrdemProducao.DBEdit28Enter(Sender: TObject);
var
 wProdutoAcabado: string;
begin
  inherited;
  with DMBoletim do
  begin
    if (trim(DBEdit7.Text) <> '') then
    begin
      wProdutoAcabado := DMOracle.FastSelect('COD_PRODUTO','TB_FORMULA','COD_FORMULA = ' + trim(DBEdit7.Text));
      if (DBRGPercaProduto.ItemIndex = 0) then
      begin
        DBEdit28.ReadOnly := True;
        DBEdit28.Text := wProdutoAcabado;
        EdProduto.Text := DMOracle.FastSelect('DESC_PRODUTO','TB_PRODUTO','COD_PRODUTO = ' + QuotedStr(wProdutoAcabado));
      end;
    end;
  end;
end;

procedure TFBoletimOrdemProducao.ProjeodeCompra1Click(Sender: TObject);
begin
  inherited;
  FBoletimCad.ProjeodeCompra1Click(Sender);
end;

procedure TFBoletimOrdemProducao.SBAlterarClick(Sender: TObject);
begin
  inherited;
  DmBoletim.QBoletimCOD_USUARIO.Value := DmUsuario.CodUsuarioCorrente;
end;

procedure TFBoletimOrdemProducao.DBGrid4CellClick(Column: TColumn);
begin
  inherited;
  if (DBEdit28.Text <> '') then
    EdProduto.Text := DMOracle.FastSelect('DESC_PRODUTO','TB_PRODUTO','COD_PRODUTO = ' + DBEdit28.Text)
  else
  begin
    ShowMessage('Este boletim não tem perca de produção lançada. Caso tenha, edite o mesmo e realize o lançamento!');
    EdProduto.Text := '';
  end;
end;

procedure TFBoletimOrdemProducao.DBRGPercaProdutoClick(Sender: TObject);
var
 wProduto, wDescProduto, wFormula: string;
begin
  inherited;
  if (DBRGPercaProduto.ItemIndex = 0) then
  begin
    wFormula := DMOracle.FastSelect('COD_FORMULA','TB_BOLETIM','COD_BOLETIM = ' + DBEdit27.Text);
    wProduto := DMOracle.FastSelect('COD_PRODUTO','TB_FORMULA','COD_FORMULA = ' + wFormula);
    wDescProduto := DMOracle.FastSelect('DESC_PRODUTO','TB_PRODUTO','COD_PRODUTO = ' + wProduto);
    EdProduto.Text := wDescProduto;
    DBEdit28.Text := wProduto;
  end;
end;

procedure TFBoletimOrdemProducao.DBRGPercaProdutoExit(Sender: TObject);
begin
  inherited;
  if (DBRGPercaProduto.ItemIndex = 0) then
    DBEdit29.SetFocus;
end;

procedure TFBoletimOrdemProducao.DBEdit7Exit(Sender: TObject);
begin
  inherited;
  With DMBoletim,DMFormula do
  begin
    if DBEdit7.Text <> '' then
    begin
      QFormulaCons.Close;
      QFormulaCons.SetVariable('COD_FORMULA',StrToInt(Trim(DBEdit7.Text)));
      QFormulaCons.Open;
      if QFormulaConsIND_SITUACAO.Value = 'DESATIVADA' then
      begin
        DBEdit7.SetFocus;
        Raise Exception.Create('Fórmula está desativada. Operação não permitida!');
      end;
      QBoletimProducaoCOD_FORMULA.Value := QFormulaConsCod_Formula.Value;
    end;
  end;
end;

end.
