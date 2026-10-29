unit UOrdemServicoCad;

interface
                                             
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Menus, Db, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, Grids, DBGrids, OracleNavigator, UBiblioteca, variants,
  DBDirceu, UFmOperacao, ActnList, DBPanel, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, StrUtils,shellApi, DBClient, UBibAssistencia,
  UFmVendedor, PngImage;

type
  TFOrdemServicoCad = class(TFTCadSimples)
    PCOrdemServico: TPageControl;
    TSCab: TTabSheet;
    TabSheet2: TTabSheet;
    Label3: TLabel;
    DBMemo1: TDBMemo;
    Label5: TLabel;
    DBMemo2: TDBMemo;
    DBGrid1: TDBGrid;
    SpeedButton2: TSpeedButton;
    SBFechaOS: TSpeedButton;
    Entrada1: TMenuItem;
    Sada1: TMenuItem;
    RelSinttico1: TMenuItem;
    RelAnaltico1: TMenuItem;
    MdiaAtendimento1: TMenuItem;
    Recibo1: TMenuItem;
    OSemAberto1: TMenuItem;
    Opes1: TMenuItem;
    FecharOS1: TMenuItem;
    VoltarOS1: TMenuItem;
    DBPDescCadastro: TDBPanel;
    DBPanel2: TDBPanel;
    DBPCadastro: TDBPanel;
    DBPanel4: TDBPanel;
    DBPanel5: TDBPanel;
    DBPanel6: TDBPanel;
    DBPFilial: TDBPanel;
    DBPTecnico: TDBPanel;
    DBPanel9: TDBPanel;
    DBPanel1: TDBPanel;
    DBPanel10: TDBPanel;
    DBPanel7: TDBPanel;
    DBPProduto: TDBPanel;
    DBPanel12: TDBPanel;
    DBPanel13: TDBPanel;
    DBPanel14: TDBPanel;
    DBPanel15: TDBPanel;
    DBPCFOP: TDBPanel;
    DBPanel11: TDBPanel;
    DBPanel17: TDBPanel;
    DBPanel18: TDBPanel;
    BtIncluir: TBitBtn;
    BtEditar: TBitBtn;
    BtExcluir: TBitBtn;
    BtConfirmar: TBitBtn;
    BtCancelar: TBitBtn;
    DSItens: TDataSource;
    Cortesia1: TMenuItem;
    EnviarSMS1: TMenuItem;
    EdCodBarras: TEdit;
    Label1: TLabel;
    DBPanel19: TDBPanel;
    DBPanel20: TDBPanel;
    TSObservacoes: TTabSheet;
    TSCheckList: TTabSheet;
    DBMemo3: TDBMemo;
    DSCheckList: TDataSource;
    GBEquipamento: TGroupBox;
    BDCBWindowsOriginal: TDBCheckBox;
    DBCBOfficeOriginal: TDBCheckBox;
    DBCBEmail: TDBCheckBox;
    DBCBCertificado: TDBCheckBox;
    DBCBGarantia: TDBCheckBox;
    DBCBDeslocamento: TDBCheckBox;
    DBCBSistemaTerceiros: TDBCheckBox;
    DBCBConferirCadastro: TDBCheckBox;
    DBCBGabineteSemTampa: TDBCheckBox;
    DBCBColarEtiquetas: TDBCheckBox;
    DBPSenhaEmail: TDBPanel;
    GBNotebookDesktop: TGroupBox;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    DBCheckBox4: TDBCheckBox;
    DBCheckBox5: TDBCheckBox;
    DBCheckBox6: TDBCheckBox;
    DBCheckBox7: TDBCheckBox;
    DBCheckBox8: TDBCheckBox;
    DBCheckBox9: TDBCheckBox;
    DBCheckBox10: TDBCheckBox;
    DBCheckBox11: TDBCheckBox;
    DBCheckBox12: TDBCheckBox;
    DBCBInstalarCertificados: TDBCheckBox;
    DBCheckBox14: TDBCheckBox;
    DBCheckBox15: TDBCheckBox;
    DBCheckBox16: TDBCheckBox;
    DBCheckBox17: TDBCheckBox;
    DBCheckBox18: TDBCheckBox;
    DBCheckBox19: TDBCheckBox;
    DBCheckBox20: TDBCheckBox;
    DBCheckBox21: TDBCheckBox;
    DBCheckBox22: TDBCheckBox;
    GBNoBreak: TGroupBox;
    GBMonitor: TGroupBox;
    GBImpressora: TGroupBox;
    DBCheckBox23: TDBCheckBox;
    DBCheckBox24: TDBCheckBox;
    DBCheckBox25: TDBCheckBox;
    DBCheckBox26: TDBCheckBox;
    DBCheckBox27: TDBCheckBox;
    DBCheckBox28: TDBCheckBox;
    DBCheckBox29: TDBCheckBox;
    DBCheckBox30: TDBCheckBox;
    DBCheckBox31: TDBCheckBox;
    DBCheckBox32: TDBCheckBox;
    MEPlaca: TMaskEdit;
    SBVeiculo: TSpeedButton;
    Label2: TLabel;
    EdModelo: TEdit;
    DBPQteHoras: TDBPanel;
    LbNumFabricante: TLabel;
    EdNumFabricante: TEdit;
    Oramento1: TMenuItem;
    DBPLote: TDBPanel;
    DBPTributacao: TDBPanel;
    IniciarManuteno1: TMenuItem;
    FinalizarServio1: TMenuItem;
    DBPanel3: TDBPanel;
    DBPanel16: TDBPanel;
    DBPVencimento: TDBPanel;
    DBPanel21: TDBPanel;
    DBPanel22: TDBPanel;
    DBPanel8: TDBPanel;
    DBCheckBox13: TDBCheckBox;
    CBSenha: TCheckBox;
    DBSenhaEquipamento: TDBPanel;
    Reimprimir1: TMenuItem;
    TsFichaInspecao: TTabSheet;
    Label33: TLabel;
    DBEdit29: TDBEdit;
    sbImprimeFichaInspecao: TSpeedButton;
    DSFichaCons: TDataSource;
    Label6: TLabel;
    DBGEquipamento: TDBGrid;
    LBDescPercas: TLabel;
    MEDescPecas: TMaskEdit;
    LBDescServicos: TLabel;
    MEDescServicos: TMaskEdit;
    MEDescPecasPerc: TMaskEdit;
    MEDescServicosPerc: TMaskEdit;
    LBDescServicoPerc: TLabel;
    LBDescPercasPerc: TLabel;
    DBPKMAtual: TDBPanel;
    Label4: TLabel;
    DBRadioGroup1: TDBRadioGroup;
    DBECilindros: TDBEdit;
    DBPCidadePrestacao: TDBPanel;
    DBPanelVendedor: TDBPanel;
    DBPSupervisor: TDBPanel;
    DBMObs_Cab: TDBMemo;
    EdNumNfe: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    EdNumNfse: TEdit;
    NFe1: TMenuItem;
    ReemitirNotaFiscal1: TMenuItem;
    ExportarNotaFiscal1: TMenuItem;
    EnviarNotaFiscalporEmail1: TMenuItem;
    DBMemo4: TDBMemo;
    Label9: TLabel;
    Label10: TLabel;
    TSCheckListGeo: TTabSheet;
    GroupBox1: TGroupBox;
    DBCheckBox33: TDBCheckBox;
    DBCheckBox34: TDBCheckBox;
    DBCheckBox35: TDBCheckBox;
    DBCheckBox36: TDBCheckBox;
    DBCheckBox37: TDBCheckBox;
    DBCheckBox38: TDBCheckBox;
    DBCheckBox39: TDBCheckBox;
    DBCheckBox40: TDBCheckBox;
    DBCheckBox41: TDBCheckBox;
    DBCheckBox42: TDBCheckBox;
    DBCheckBox43: TDBCheckBox;
    DBPTabelaPreco: TDBPanel;
    DBPTecnico3: TDBPanel;
    DBPTecnico2: TDBPanel;
    ArquivarOS1: TMenuItem;
    ReenviarBoletos1: TMenuItem;
    BoletosEMail1: TMenuItem;
    ImprimirBoletos1: TMenuItem;
    EdNomeFantasia: TEdit;
    LbNomeFantasia: TLabel;
    Label11: TLabel;
    METelefone: TMaskEdit;
    Label12: TLabel;
    MECelular: TMaskEdit;
    DBEAlturaCabE: TDBEdit;
    DBEAlturaCabS: TDBEdit;
    LAlturaCabE: TLabel;
    LAlturaCabS: TLabel;
    procedure SBConsultaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure Entrada1Click(Sender: TObject);
    procedure Sada1Click(Sender: TObject);
    procedure RelSinttico1Click(Sender: TObject);
    procedure RelAnaltico1Click(Sender: TObject);
    procedure MdiaAtendimento1Click(Sender: TObject);
    procedure Recibo1Click(Sender: TObject);
    procedure OSemAberto1Click(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure SBHelpClick(Sender: TObject);
    procedure VoltarOS1Click(Sender: TObject);
    procedure FecharOS1Click(Sender: TObject);
    procedure SBExcluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SBFechaOSClick(Sender: TObject);
    procedure SBAlterarClick(Sender: TObject);
    procedure SBCancelarClick(Sender: TObject);
    function MedipecasRenderizar(Sender: TObject): Boolean;
    procedure DBPLoteDefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPTributacaoDefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPCadastroCodigoExit(Sender: TObject);
    procedure DBPTecnicoDefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPanel10DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPanel8DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPFilialDefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPCadastroDefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPCadastroAfterConsulta(Sender: TObject);
    procedure DBPProdutoCodigoExit(Sender: TObject);
    procedure DBPProdutoDefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPProdutoAfterConsulta(Sender: TObject);
    procedure BtConfirmarClick(Sender: TObject);
    procedure BtIncluirClick(Sender: TObject);
    procedure BtEditarClick(Sender: TObject);
    procedure BtExcluirClick(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure DSItensStateChange(Sender: TObject);
    procedure Cortesia1Click(Sender: TObject);
    procedure EnviarSMS1Click(Sender: TObject);
    procedure EdCodBarrasExit(Sender: TObject);
    procedure DBPanel14Exit(Sender: TObject);
    procedure DBPanel19DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure ImprimeEtiquetaOS;
    procedure DBPanel15Exit(Sender: TObject);
    procedure DBPanel20Exit(Sender: TObject);
    procedure DBPanel13CodigoExit(Sender: TObject);
    procedure CBSenhaClick(Sender: TObject);
    procedure DBCBEmailClick(Sender: TObject);
    procedure DBCBSenhaWindowsClick(Sender: TObject);
    procedure DBCBCertificadoClick(Sender: TObject);
    procedure SBVeiculoClick(Sender: TObject);
    procedure MePlacaExit(Sender: TObject);
    procedure MELocalizaExit(Sender: TObject);
    procedure SBIncluirClick(Sender: TObject);
    procedure EdNumFabricanteExit(Sender: TObject);
    procedure Oramento1Click(Sender: TObject);
    procedure EdNumFabricanteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure IniciarManuteno1Click(Sender: TObject);
    procedure FinalizarServio1Click(Sender: TObject);
    procedure DBPanel14Enter(Sender: TObject);
    procedure DBPVencimentoDefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure Reimprimir1Click(Sender: TObject);
    procedure ImprimeEtiquetaOS_EPL;
    procedure ImprimeEtiquetaGEOPRO;
    procedure sbImprimeFichaInspecaoClick(Sender: TObject);
    procedure DBGEquipamentoCellClick(Column: TColumn);
    procedure DBGEquipamentoColExit(Sender: TObject);
    procedure DBGEquipamentoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RateioDescontoRetifoz(ValDescServico, ValDescPecas: String);
    procedure LeDescontoRetifoz;
    procedure MEDescPecasPercExit(Sender: TObject);
    procedure MEDescServicosPercExit(Sender: TObject);
    procedure DBPCidadePrestacaoDefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure ReemitirNotaFiscal1Click(Sender: TObject);
    procedure ExportarNotaFiscal1Click(Sender: TObject);
    procedure EnviarNotaFiscalporEmail1Click(Sender: TObject);
    procedure DBPTabelaPrecoCodigoChange(Sender: TObject);
    procedure DBPTabelaPrecoCodigoExit(Sender: TObject);
    procedure DBPTabelaPrecoEnter(Sender: TObject);
    procedure DBPTabelaPrecoDefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPanel8Exit(Sender: TObject);
    procedure ArquivarOS1Click(Sender: TObject);
    procedure DBPTecnicoCodigoExit(Sender: TObject);
    procedure ReenviarBoletos1Click(Sender: TObject);
    procedure BoletosEMail1Click(Sender: TObject);
    procedure ImprimirBoletos1Click(Sender: TObject);

  private
    { Private declarations }
    wCodigoTabelaPreco: integer; // Utilizado no change do componente. Para saber se código foi alterado ou não
    wAlterouLista: boolean;
    function TestaExisteNota: boolean;
    procedure ValidaQuantidadeMinima;
    procedure ControleEstoqueOS(Sender: TObject);
    procedure ValidaCamposNFeCadastro;
    procedure GeraBoletoApi;
    procedure ImprimeBoletoApi;
    procedure EnviarEmailBoletoApi;
    procedure AtivaDesativaAPI;
    procedure CalcularDesconto(Origem: string);

  public
    { Public declarations }
  end;

var
  FOrdemServicoCad: TFOrdemServicoCad;
  ind_tipo_produto: String;
  ValDescServicoTela, ValDescPecaTela: Double;
  BibAssistencia: TBibAssistencia;

implementation

uses UOrdemServico_cl, UOrdemServicoCons, UCadastroCons, UCadastro_cl,
  UProdutoCons, UProduto_cl, UOracle_cl, UOrdemServicoFecha,
  UFilialCons, UFilial_cl, UVendedorCons, UPrazoVencimentoCons,
  UVendedor_cl, UROrdemServico_Saida, UOrdemServicoParam, UPrazoVencimento_cl,
  UROrdemServico_Sintetico, UROrdemServico_Analitico, UROrdemServico_Media,
  UROrdemServico_Aberto, UReciboParam, UParamSistema_cl, UEstoque_cl,
  UNotaSaida_cl, USerie_cl, UUsuario_cl, UVeiculoCons, UVeiculo_cl,
  UOperacaoCons, UOperacao_cl, UROrdemServico_Entrada, UTipoLote_cl,
  UTipoLoteCons, UTributacaoCons, OracleData, USenha, URSaida,
  UMensagemCons, UROrdemServico_Entrada2, UROrdemServico_Entrada3,
  UVeiculoCad, UROrcamentoOS, UROrdemServico_Entrada4, UNotaImpressao,
  UOrdemServicoRetifoz, URFichaInspecao, UPlanilha_cl, UCidadeCons,
  UNfe_cl, UROrdemServico_Entrada5, UROrdemServico_Entrada6,
  UNfEletronicaLoteCons, UTabelaPrecoCons, UROrdemServico_Entrada7,
  //API de boletos
  BoletoAPI.BoletoFactory, BoletoApi.Interfaces, UROrcamentoOsSemDesconto;

{$R *.DFM}

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


procedure TFOrdemServicoCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FOrdemServicoCons = nil then
    FOrdemServicoCons := TFOrdemServicoCons.Create(Application);
  if FOrdemServicoCons.ShowModal = mrOk then
    with DMOrdemServico do
    begin
      QOrdemServico.Close;
      QOrdemServico.SetVariable('PK', QOrdemServicoConsCod_Ordem_Servico_Cab.Value);
      QOrdemServico.Open;
      if QOrdemServicoCOD_VEICULO.Value > 0 then
      begin
        MePlaca.Text :=  DMOracle.FastSelect('NUM_PLACA','TB_VEICULO','COD_VEICULO = ' + QOrdemServicoCOD_VEICULO.Text);
        MePlacaExit(Sender);
      end
      else
      begin
        MEPlaca.Clear;
        EdModelo.Clear;
      end;
    end;
  if DMOrdemServico.QOrdemServicoDt_Saida.Value > 0 then
  begin
    MMCadSimples.Items[2].Items[0].Enabled := false;
    MMCadSimples.Items[2].Items[6].Enabled := true;
    MMCadSimples.Items[2].Items[1].Enabled := true;
  end
  else
  begin
    MMCadSimples.Items[2].Items[0].Enabled := true;
    MMCadSimples.Items[2].Items[6].Enabled := False;
    MMCadSimples.Items[2].Items[1].Enabled := false;
  end;

  if (DMParamSistema.CodEmpresa = 'RETIFOZ') or (DMParamSistema.CodEmpresa = 'RRPECAS') or (DMParamSistema.CodEmpresa = 'RSMECANICA') then
    LeDescontoRetifoz;

  if (DMParamSistema.CodEmpresa = 'CENTERFRIO') or (DMParamSistema.CodEmpresa = 'GEOPRO') then
  begin
    if DMOrdemServico.QOrdemServicoCOD_ORDEM_SERVICO_CAB.AsString <> '' then
    begin
      EdNumNfe.Text :=  DMOracle.FastSelect('NUM_NOTA','TB_NOTA_CAB','COD_ORDEM_SERVICO_CAB = ' + DMOrdemServico.QOrdemServicoCOD_ORDEM_SERVICO_CAB.Text
                                            + ' and COD_SERIE_MODELO <> '+ QuotedStr('98'));
      EdNumNfse.Text := DMOracle.FastSelect('NUM_NFSE','TB_NOTA_CAB','COD_ORDEM_SERVICO_CAB = ' + DMOrdemServico.QOrdemServicoCOD_ORDEM_SERVICO_CAB.Text);
    end;
  end
  else
  begin
    EdNumNfe.Clear;
    EdNumNfse.Clear;
  end;
  if (DMOrdemServico.QOrdemServicoCOD_CADASTRO.Text <> '') then
  begin
    EdNomeFantasia.Text := DMOracle.FastSelect('DESC_FANTASIA','TB_CADASTRO','COD_CADASTRO = ' + DMOrdemServico.QOrdemServicoCOD_CADASTRO.Text);
    METelefone.EditText := DMOracle.FastSelect('DESC_TELEFONE','TB_CADASTRO','COD_CADASTRO = ' + DMOrdemServico.QOrdemServicoCOD_CADASTRO.Text);
    MECelular.EditText := DMOracle.FastSelect('DESC_CELULAR','TB_CADASTRO','COD_CADASTRO = ' + DMOrdemServico.QOrdemServicoCOD_CADASTRO.Text);
  end;
end;

procedure TFOrdemServicoCad.FormActivate(Sender: TObject);
begin
  inherited;
  if (DMParamSistema.CodEmpresa <> 'NIR') then
  begin
    EdNomeFantasia.Enabled := false;
    LbNomeFantasia.Enabled := false;
    EdNomeFantasia.Visible := false;
    LbNomeFantasia.Visible := false;
    METelefone.Enabled := false;
    METelefone.Visible := false;
    MECelular.Enabled := false;
    MECelular.Visible := false;
    Label11.Enabled := false;
    Label11.Visible := false;
    Label12.Enabled := false;
    Label12.Visible := false;
  end;
  if (DMParamSistema.CodEmpresa <> 'GEOPRO') then
    ArquivarOS1.Visible := false;
  DBPTecnico2.Enabled := False;
  DBPTecnico2.Visible := False;
  DBPTecnico3.Enabled := False;
  DBPTecnico3.Visible := False;
  if (DMParamSistema.CodEmpresa <> 'MEDIPECAS')  and (DMParamSistema.CodEmpresa <> 'MEDSYSTEM') and (DMParamSistema.CodEmpresa <> 'FURGOESMED') and
     (DMParamSistema.CodEmpresa <> 'BENINI')     and (DMParamSistema.CodEmpresa <> 'REDIESEL')  and (DMParamSistema.CodEmpresa <> 'DATEL') 	    and
     (DMParamSistema.CodEmpresa <> 'PATELI')     and (DMParamSistema.CodEmpresa <> 'ZIEL') 	    and (DMParamSistema.CodEmpresa <> 'JOFER')  	  and
     (DMParamSistema.CodEmpresa <> 'RRPECAS') 	 and (DMParamSistema.CodEmpresa <> 'COMIN')     and (DMParamSistema.CodEmpresa <> 'NFCE-IVO')   and
     (DMParamSistema.CodEmpresa <> 'RSMECANICA') and (DMParamSistema.CodEmpresa <> 'ZANONI')    and (DMParamSistema.CodEmpresa <> 'ALFA')       and
     (DMParamSistema.CodEmpresa <> 'RENATOAUTO') then
  begin
     SBVeiculo.Visible := false;
  end;
  with DMOrdemServico do
  begin
    QOrdemServico.Open;
    QOrdemServicoIt.Open;
    QOrdemServicoCheckList.Open;
    QSomaItemOS.Open;

    QEquipamentoFichaCons.Open;
    QTipoEquipamentoCons.Open;
    QEquipamentoFicha.Open;

  end;
  PCOrdemServico.ActivePage := TSCab;
  DBPCidadePrestacao.Visible := DMParamSistema.CodEmpresa = 'GEOPRO';
  if (DMParamSistema.CodEmpresa = 'FURGOESMED') then
  begin
    DBPCFOP.CodigoTabStop := False;
    DBPCFOP.TabStop := False;
    DBPanel8.Visible := True;
    DBPanel8.Enabled := True;    
    DBPanel8.Left := 285;
    DBPanel8.top := 220;
  end;
  if DMParamSistema.CodEmpresa = 'ANDROID' then
  begin
    DBCheckBox13.Visible := True;
  end;
  if DMParamSistema.CodEmpresa = 'NUTRIVET' then
  begin
    DBPVencimento.Visible := False;
    Label2.Visible := False;
    MEPlaca.Visible := False;
    SBVeiculo.Enabled := False;
    SBVeiculo.Visible := False;
    EdModelo.Visible := False;
    DBPanel10.Left := 8;
    Label3.Caption := 'Animal';
    DBPTributacao.Visible := False;
    PCOrdemServico.Pages[3].TabVisible := False; 
  end;
  if DMParamSistema.CodEmpresa = 'RETIFOZ' then
  begin
    MEDescPecas.Enabled := false;
    MEDescServicos.Enabled := false;
    MEDescPecasPerc.Enabled := false;
    MEDescServicosPerc.Enabled := false;
    DBPKMAtual.Visible := True;
  end;

  if DMParamSistema.CodEmpresa = 'NIR' then
  begin
    DBSenhaEquipamento.Visible := True;
    CBSenha.Visible            := True;
    DBSenhaEquipamento.Required := True;
    Label2.Visible := False;
    MEPlaca.Visible := False;
    SBVeiculo.Enabled := False;
    SBVeiculo.Visible := False;
    EdModelo.Visible := False;
    DBPKMAtual.Visible := False;
    Label4.Visible := False;
    DBECilindros.Visible := False;
    DBRadioGroup1.Visible := False;
    DBPVencimento.Visible := False;
    BtCopia.Enabled := false;
    BtCopia.Visible := false;
    EdNomeFantasia.Top := 51;
    LbNomeFantasia.Top := 35;
    METelefone.Top := 87;
    METelefone.Left := 208;
    MECelular.Top := 87;
    MECelular.Left := 330;
    Label11.Top := 74;
    Label11.Left := 208;
    Label12.Top := 74;
    Label12.Left := 330;
  end;

  if (DMParamSistema.CodEmpresa <> 'CENTERFRIO') then
  begin
     DBPSupervisor.Enabled   := False;
     DBPSupervisor.Visible   := False;
     DBPanelVendedor.Enabled := False;
     DBPanelVendedor.Visible := False;
  end;

  //Adicionado o segundo tecnico para RRPECAS . Andre 02/09/2024 cod. suporte 9583.
  if (DMParamSistema.CodEmpresa = 'RRPECAS') or (DMParamSistema.CodEmpresa = 'RSMECANICA')then
  begin
    DBPTecnico.LCaption := 'Mecanico';
    DBPanelVendedor.Enabled := True;
    DBPanelVendedor.Visible := True;
    DBPanelVendedor.LCaption := 'Mecanico 2';
  end;

  if (DMParamSistema.CodEmpresa = 'GEOPRO') then
  begin
    DBPanel16.ReadOnly := False;
    DBPKMAtual.Visible := False;
    DBPanel3.LCaption := 'Início Serviço';
    DBPanel16.LCaption := 'Finalização Serviço';
    Label4.Visible := False; //Cilindro
    DBECilindros.Visible := False;
    DBRadioGroup1.Visible := False;
    DBPCidadePrestacao.Top := 220;
    DBPCidadePrestacao.Left := 300;

    EdNumNfe.Visible := true;
    EdNumNFe.Enabled := true;
    label7.Visible := true;
    label7.Enabled := true;
    EdNumNfse.Visible := true;
    EdNumNFse.Enabled := true;
    label8.Visible := true;
    label8.Enabled := true;

    DBPanel3.Top := 36;
    DBPanel3.Left := 611;
    DBPanel16.Top := 72;
    DBPanel16.Left := 611;
    EdNumNfe.Top := 118;
    EdNumNfe.Left := 611;
    Label7.Top := 107;
    Label7.Left := 611;
    EdNumNfse.Top := 156;
    EdNumNfse.Left := 611;
    Label8.Top := 143;
    Label8.Left := 611;
  end;
//Criado campo para CenterFrio, pois é necessário separar as Observações quando é nota de serviço e quando é nota fiscal, pois as notas emitidads para a prefeitura
//tem número de empenho diferentes.  Alex 24/03/2022
  if (DMParamSistema.CodEmpresa = 'CENTERFRIO') then
  begin
    EdNumNfe.Visible := true;
    EdNumNFe.Enabled := true;
    label7.Visible := true;
    label7.Enabled := true;
    EdNumNfse.Visible := true;
    EdNumNFse.Enabled := true;
    label8.Visible := true;
    label8.Enabled := true;

    DBPanel3.Top := 36;
    DBPanel3.Left := 611;
    DBPanel16.Top := 72;
    DBPanel16.Left := 611;
    EdNumNfe.Top := 118;
    EdNumNfe.Left := 611;
    Label7.Top := 107;
    Label7.Left := 611;
    EdNumNfse.Top := 156;
    EdNumNfse.Left := 611;
    Label8.Top := 143;
    Label8.Left := 611;

    DBMemo4.Enabled := true;
    DBMemo4.Visible := true;
    Label9.Enabled := true;
    Label9.Visible := true;
    Label10.Enabled := true;
    Label10.Visible := true;
//campo para informar a cidade de prestação de serviço.
    DBPCidadePrestacao.Visible := True;
    DBPCidadePrestacao.Top := 220;
    DBPCidadePrestacao.Left := 300;
  end;
//Solicitado pela Neida da Medsystem. Cod_suporte: 5241. Alex 30/06/2022
//Adicionado RRPECAS. Alex 18/10/2023
  if (DMParamSistema.CodEmpresa = 'MEDSYSTEM') or  (DMParamSistema.CodEmpresa = 'JOFER')      or (DMParamSistema.CodEmpresa = 'RRPECAS')   or
     (DMParamSistema.CodEmpresa = 'RSMECANICA') or (DMParamSistema.CodEmpresa = 'ZANONI')     or (DMParamSistema.CodEmpresa = 'RENATOAUTO') then
  begin
    DBPKMAtual.Enabled := True;
    DBPKMAtual.Visible := True;
  end;
  if (DMParamSistema.CodEmpresa = 'PATELI') then
  begin
    DBPVencimento.Enabled := False;
    DBPVencimento.Visible := False;
    DBPanel8.Visible := True;
    DBPanel8.Enabled := True;
    DBPanel8.Left := 285;
    DBPanel8.top := 220;
    DBPTecnico.LCaption := 'Técnico 1';
    DBPTecnico3.Enabled := True;
    DBPTecnico3.Visible := True;
    DBPTecnico3.Left := 344;
    DBPanelVendedor.Enabled := True;
    DBPanelVendedor.Visible := True;
    DBPTecnico2.Enabled := True;
    DBPTecnico2.Visible := True;
    DBPTecnico2.Left := 344;
    DBPTecnico2.Top := 108;
  end;
  MELocaliza.SetFocus;
  if (DMParamSistema.CodEmpresa = 'NFCE-IVO') then
  begin
    DBPanelVendedor.Enabled := True;
    DBPanelVendedor.Visible := True;
  end;
  if (DMParamSistema.CodEmpresa <> 'ALFA') then
  begin
    DBEAlturaCabE.Enabled := False;
    DBEAlturaCabE.Visible := False;
    DBEAlturaCabS.Enabled := False;
    DBEAlturaCabS.Visible := False;
    LAlturaCabE.Enabled := False;
    LAlturaCabE.Visible := False;
    LAlturaCabS.Enabled := False;
    LAlturaCabS.Visible := False;
  end;
  if (DMParamSistema.CodEmpresa = 'ALFA') then
  begin
    DBEAlturaCabE.Left := 8;
    DBEAlturaCabE.Top := 198;
    DBEAlturaCabS.Left := 100;
    DBEAlturaCabS.Top := 198;
    LAlturaCabE.Top := 182;
    LAlturaCabE.Left := 8;
    LAlturaCabS.Top := 182;
    LAlturaCabS.Left := 100;
    DBPanel19.Top := 145;
    DBPanel10.Top := 145;
    DBPanel6.Top := 145;
    DBPanel8.Visible := True;
    DBPanel8.Enabled := True;
    DBPanel8.Left := 285;
    DBPanel8.top := 220;
  end;
end;

procedure TFOrdemServicoCad.CalcularDesconto(Origem: string);
begin
  with DMOrdemServico do
  begin
    if not DSItens.DataSet.Active then
      Exit;

    if DSItens.DataSet.State = dsBrowse then
      DSItens.DataSet.Edit;

    // ?? Se alterou o VALOR do desconto
    if Origem = 'VALOR' then
    begin
      if QOrdemServicoItVAL_DESCONTO.Value = 0 then
      begin
        QOrdemServicoItPERC_DESCONTO.Value := 0;
      end
      else if QOrdemServicoItVL_UNITARIO.Value > 0 then
      begin
        QOrdemServicoItPERC_DESCONTO.Value :=
          (QOrdemServicoItVAL_DESCONTO.Value * 100) /
          QOrdemServicoItVL_UNITARIO.Value;
      end;
    end;

    // ?? Se alterou o PERCENTUAL do desconto
    if Origem = 'PERCENTUAL' then
    begin
      if QOrdemServicoItPERC_DESCONTO.Value = 0 then
      begin
        QOrdemServicoItVAL_DESCONTO.Value := 0;
      end
      else
      begin
        QOrdemServicoItVAL_DESCONTO.Value :=
          QOrdemServicoItVL_UNITARIO.Value *
          QOrdemServicoItPERC_DESCONTO.Value / 100;
      end;
    end;
  end;
end;

procedure TFOrdemServicoCad.SBConfirmarClick(Sender: TObject);
var
wAux, wEstoqueNegativo, wTelefone, wCelular : string;
begin
  inherited;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'MEDIPECAS' then
    if DMOrdemServico.QOrdemServicoItCOD_PRODUTO.Text = '' then
      DMOrdemServico.QOrdemServicoIt.cancel;
  try
    if not BibAssistencia.VerificaEstoqueNegativo(wEstoqueNegativo) then
      ControleEstoqueOS(Sender)
    else
    begin
      MessageDlg('Produtos com estoque negativo!!', mtError, [mbOk], 0);
      Raise Exception.Create('Verifique os produtos antes de continuar: ' + wEstoqueNegativo);
    end;
  Except
    on E: Exception do
    begin
      MessageDlg(E.Message, mtError, [mbOk], 0);
      DMOrdemServico.QOrdemServico.Edit;
      Exit;
    end;
  end;

  if (DMParamSistema.CodEmpresa = 'RETIFOZ') or (DMParamSistema.CodEmpresa = 'RRPECAS') or (DMParamSistema.CodEmpresa = 'RSMECANICA') or
     (DMParamSistema.CodEmpresa = 'RENATOAUTO') then
  begin
    if (DMOrdemServico.QOrdemServicoIt.RecordCount > 0) and
        ((MEDescServicosPerc.Text <> '') or (MEDescPecasPerc.Text <> '')) then
      RateioDescontoRetifoz(MEDescServicosPerc.Text, MEDescPecasPerc.Text);
    MEDescPecasPerc.Enabled := false;
    MEDescServicosPerc.Enabled := false;
    wAux := DMOracle.BuscaNome('SELECT COD_ORDEM_SERVICO_CAB FROM TB_FICHA_INSPECAO_VEICULAR','COD_ORDEM_SERVICO_CAB ='+
       DMOrdemServico.QOrdemServicoCOD_ORDEM_SERVICO_CAB.Text+ 'and QT_QUANTIDADE > 0');
    If wAux <> DMOrdemServico.QOrdemServicoCOD_ORDEM_SERVICO_CAB.Text Then
      DMOracle.ExecutaSql('INSERT INTO TB_FICHA_INSPECAO_VEICULAR(COD_FICHA_INSPECAO_VEICULAR, COD_ORDEM_SERVICO_CAB,'+
                          'COD_EQUIPAMENTO_FICHA, QT_QUANTIDADE) VALUES(SQEQUIPAMENTOFICHA.NEXTVAL,'+
                          DMOrdemServico.QOrdemServicoCOD_ORDEM_SERVICO_CAB.Text + ',1,1)' );
     // DMOracle.ExecutaSql('UPDATE TB_FICHA_INSPECAO_VEICULAR SET QT_QUANTIDADE = 1 WHERE '+
      //                   'COD_EQUIPAMENTO_FICHA = 1 AND COD_ORDEM_SERVICO_CAB = '+
      //                    DMOrdemServico.QOrdemServicoCOD_ORDEM_SERVICO_CAB.Text);

    LeDescontoRetifoz;
  end;

  if DMOrdemServico.QOrdemServico.State = dsBROWSE then
    if DMParamSistema.CodEmpresa = 'NIR' then
    begin
      DMOracle.ExecutaSql('UPDATE TB_ORDEM_SERVICO_CAB SET IND_NIR_SYNC_SITE=' + QuotedStr('N') +
          'WHERE COD_ORDEM_SERVICO_CAB=' + QuotedStr(DMOrdemServico.QOrdemServicoCOD_ORDEM_SERVICO_CAB.Text),True);
      if (MessageDlg('Deseja Imprimir Etiquetas?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
        ImprimeEtiquetaOS;
        //ImprimeEtiquetaOS_EPL;
{Adicionado o bloco abaixo para atualizar o número de telefone e celular quando for diferente do que esta no cadastro. Alex 08/10/25}        
      wTelefone := DMOracle.FastSelect('DESC_TELEFONE','TB_CADASTRO','COD_CADASTRO = ' + DMOrdemServico.QOrdemServicoCOD_CADASTRO.Text);
      wCelular := DMOracle.FastSelect('DESC_CELULAR','TB_CADASTRO','COD_CADASTRO = ' + DMOrdemServico.QOrdemServicoCOD_CADASTRO.Text);
      if (wTelefone <> METelefone.EditText) and (Trim(METelefone.EditText) <> '') then
      begin
        DMOracle.DBCemapa.StartTransaction;
        DMOracle.QExecSQL.Close;
        DMOracle.QExecSQL.SQL.Clear;
        DMOracle.QExecSQL.SQL.Add('UPDATE TB_CADASTRO SET DESC_TELEFONE = ' + chr(39) + METelefone.EditText + chr(39));
        DMOracle.QExecSQL.SQL.Add('WHERE COD_CADASTRO = ' + chr(39) + DMOrdemServico.QOrdemServicoCOD_CADASTRO.Text + chr(39));
        DMOracle.QExecSQL.ExecSQL;
        DMOracle.DBCemapa.Commit;
      end;
      if (wCelular <> MECelular.EditText) and (Trim(MECelular.EditText) <> '') then
      begin
        DMOracle.DBCemapa.StartTransaction;
        DMOracle.QExecSQL.Close;
        DMOracle.QExecSQL.SQL.Clear;
        DMOracle.QExecSQL.SQL.Add('UPDATE TB_CADASTRO SET DESC_CELULAR = ' + chr(39) + MECelular.EditText + chr(39));
        DMOracle.QExecSQL.SQL.Add('WHERE COD_CADASTRO = ' + chr(39) + DMOrdemServico.QOrdemServicoCOD_CADASTRO.Text + chr(39));
        DMOracle.QExecSQL.ExecSQL;
        DMOracle.DBCemapa.Commit;
      end;
    end
    else if (DMParamSistema.CodEmpresa = 'GEOPRO') and (MessageDlg('Deseja Imprimir Etiquetas?', mtConfirmation, [mbYes, mbNo], 0) = mrYes)  then
      ImprimeEtiquetaGEOPRO;
end;

procedure TFOrdemServicoCad.Entrada1Click(Sender: TObject);
var
  wLpt_Pedido, filial, cliente, endFilial, foneFilial: string;
  wCont, n: integer;
  wVlUnitario, wQuant: real;
begin
  inherited;

  if DMParamSistema.CodEmpresa <> 'ENCOPEL' then
  begin
    if (DMParamSistema.CodEmpresa = 'BENINI') then
    begin
      if FROrdemServico_Entrada2 = nil then
        FROrdemServico_Entrada2 := TFROrdemServico_Entrada2.Create(Application);
      DMOrdemServico.QREntrada.Open;
      FROrdemServico_Entrada2.QRPrimario.Preview;
      DMOrdemServico.QREntrada.Close;
    end
    else
    if DMParamSistema.CodEmpresa = 'ANDROID' then
    begin
    if FROrdemServico_Entrada3 = nil then
        FROrdemServico_Entrada3 := TFROrdemServico_Entrada3.Create(Application);
        DMOrdemServico.QREntrada.Open;
        FROrdemServico_Entrada3.QRLEmpresa.Caption := DMParamSistema.QParamSistemaDESC_EMPRESA.Text;
        FROrdemServico_Entrada3.QRLabel11.Caption := DMParamSistema.QParamSistemaDESC_EMPRESA.Text;


        if DMOrdemServico.QOrdemServicoIND_COM_CHIP.Text = 'S' then  //Android quer controlar quem traz o cel com e sem chip - Vanessa 19/06/2017
        begin
          FROrdemServico_Entrada3.QRLabel29.Caption := 'COM CHIP';
          FROrdemServico_Entrada3.QRComChip.Enabled := true;
          FROrdemServico_Entrada3.QRSemChip.Enabled := false;
        end
        else
        begin
          FROrdemServico_Entrada3.QRLabel29.Caption := 'SEM CHIP';
          FROrdemServico_Entrada3.QRComChip.Enabled := false;
          FROrdemServico_Entrada3.QRSemChip.Enabled := true;
        end;

        FROrdemServico_Entrada3.QRPrimario.Preview;
        DMOrdemServico.QREntrada.Close;
    end
    else
    if (DMParamSistema.CodEmpresa = 'MEDSYSTEM') or (DMParamSistema.CodEmpresa = 'JOFER') or
       (DMParamSistema.CodEmpresa = 'RRPECAS') or (DMParamSistema.CodEmpresa = 'RSMECANICA') then
//Adicionado para a Jofer. cod_suporte: 7202 - Alex 16/05/2023
//Adicionado RRPECAS. Alex 18/10/2023
    begin
      if FROrdemServico_Entrada4 = nil then
        FROrdemServico_Entrada4 := TFROrdemServico_Entrada4.Create(Application);
      DMOrdemServico.QREntrada.Open;
      FROrdemServico_Entrada4.QRLTitulo.Caption := 'ORDEM DE SERVIÇO N.' + DMOrdemServico.QREntradaCOD_ORDEM_SERVICO_CAB.Text;
      FROrdemServico_Entrada4.QRPrimario.Preview;
      DMOrdemServico.QREntrada.Close;
    end
    else
    if (DMParamSistema.CodEmpresa = 'PATELI') then
    begin
      if FROrdemServico_Entrada5 = nil then
        FROrdemServico_Entrada5 := TFROrdemServico_Entrada5.Create(Application);

    if FileExists(ExtractFilePath(Application.ExeName) + 'logo\logo.jpg') then
    begin
      FROrdemServico_Entrada5.QRILogo.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'logo\logo.jpg');
      FROrdemServico_Entrada5.QRLabel3.Enabled := False;
    end
    else
    begin
      FROrdemServico_Entrada5.QRILogo.Picture := Nil;
      FROrdemServico_Entrada5.QRILogo.Enabled := True;
    end;
      DMOrdemServico.QREntrada.Open;
      FROrdemServico_Entrada5.QRLTitulo.Caption := 'ORDEM DE SERVIÇO N.' + DMOrdemServico.QREntradaCOD_ORDEM_SERVICO_CAB.Text;
      FROrdemServico_Entrada5.QRPrimario.Preview;
      DMOrdemServico.QREntrada.Close;
    end
    else
    if (DMParamSistema.CodEmpresa = 'CENTERFRIO')  then
    begin
      if FROrdemServico_Entrada6 = nil then
        FROrdemServico_Entrada6 := TFROrdemServico_Entrada6.Create(Application);

    if FileExists(ExtractFilePath(Application.ExeName) + 'logo\logo.jpg') then
    begin
      FROrdemServico_Entrada6.QRILogo.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'logo\logo.jpg');
      FROrdemServico_Entrada6.QRLabel3.Enabled := False;
    end
    else
    begin
      FROrdemServico_Entrada6.QRILogo.Picture := Nil;
      FROrdemServico_Entrada6.QRILogo.Enabled := True;
    end;
      DMOrdemServico.QREntrada.Open;
      FROrdemServico_Entrada6.QRLTitulo.Caption := 'ORDEM DE SERVIÇO N.' + DMOrdemServico.QREntradaCOD_ORDEM_SERVICO_CAB.Text;
      FROrdemServico_Entrada6.QRPrimario.Preview;
      DMOrdemServico.QREntrada.Close;
    end
//Solicitado por Cesar. Alex 11/08/2022
    else
    if (DMParamSistema.CodEmpresa = 'NIR') then
    begin
      if FROrdemServico_Entrada7 = nil then
        FROrdemServico_Entrada7 := TFROrdemServico_Entrada7.Create(Application);
      DMOrdemServico.QREntrada.Open;
      FROrdemServico_Entrada7.QRPrimario.Preview;
      DMOrdemServico.QREntrada.Close;
    end
    else
    begin
      if FROrdemServico_Entrada = nil then
        FROrdemServico_Entrada := TFROrdemServico_Entrada.Create(Application);
      DMOrdemServico.QREntrada.Open;
      FROrdemServico_Entrada.QRPrimario.Preview;
      DMOrdemServico.QREntrada.Close;
    end;
  end
  else
  begin
    Buscador.Limpa;
    Buscador.Adiciona('DESC_LPT_PEDIDO', 'TB_FILIAL',
      'COD_FILIAL = ' + DMOrdemServico.QOrdemServicoCOD_FILIAL.Text);
    Buscador.Adiciona('DESC_FILIAL', 'TB_FILIAL',
      'COD_FILIAL = ' + DMOrdemServico.QOrdemServicoCOD_FILIAL.Text);
    Buscador.Adiciona('DESC_ENDERECO', 'TB_FILIAL',
      'COD_FILIAL = ' + DMOrdemServico.QOrdemServicoCOD_FILIAL.Text);
    Buscador.Adiciona('DESC_TELEFONE', 'TB_FILIAL',
      'COD_FILIAL = ' + DMOrdemServico.QOrdemServicoCOD_FILIAL.Text);
    Buscador.Adiciona('NOME', 'TB_CADASTRO',
      'COD_CADASTRO = ' + DMOrdemServico.QOrdemServicoCOD_CADASTRO.Text);
    Buscador.Buscar;

    wLpt_pedido := Buscador.Proximo;
    filial := Buscador.Proximo;
    endFilial := Buscador.Proximo;
    foneFilial := Buscador.Proximo;
    cliente := Buscador.Proximo;

//    wLpt_pedido := DMOracle.BuscaNome('SELECT DESC_LPT_PEDIDO FROM TB_FILIAL', 'COD_FILIAL = ' + DMOrdemServico.QOrdemServicoCod_Filial.Text);

    //chamar a rotina de impressão DOS

    if Imp = nil then
      Imp := TImp.Create;

    if Trim(wLpt_Pedido) = 'LPT1' then
      Imp.AbreImpressora
    else if Trim(wLpt_Pedido) = 'LPT2' then
      Imp.AbreImpressora_Lpt2
    else
      Imp.AbreImpressora_Com2;

    Imp.ConfiguraImpressora('CONDENSADO_OFF', 'SEXTOS', 66);          

    wCont := 0;
    Imp.WriteXY(0, wCont, filial); //DMOrdemServico.QOrdemServiconome_filial.Value);
    Inc(wCont);
    Imp.WriteXY(0, wCont, endFilial);
    Inc(wCont);
    Imp.WriteXY(0, wCont, 'FONE: ' + foneFilial);
    Inc(wCont, 2);
    Imp.WriteXY(0, wCont, 'NUM. REQUISIÇÃO: ' + DMOrdemServico.QOrdemServicoCOD_ORDEM_SERVICO_CAB.Text);
    Inc(wCont);
    Imp.WriteXY(0, wCont, 'ENTREGA: ' + DMOrdemServico.QOrdemServicoDT_PREVISAO_ENTREGA.Text + ' ' +
      FormatDateTime('hh:nn', DMOrdemServico.QOrdemServicoHR_PREVISAO_ENTREGA.Value));
    Inc(wCont);
    Imp.WriteXY(0, wCont, Trim(DMOrdemServico.QOrdemServicoCOD_CADASTRO.Text) + ' ' + cliente); //DMOrdemServico.QOrdemServiconome_cliente.Value);
    Inc(wCont);

    // **** Itens ****
    Imp.WriteXY(0, wCont, '________________________________________');
    Inc(wCont);
    Imp.WriteXY(0, wCont, 'QTDE DESCRICAO');
    Inc(wCont);
    Imp.WriteXY(2, wCont, ' VL. UNIT.');
    Imp.WriteXY(5, wCont, '   TOTAL');
    Inc(wCont);
    Imp.WriteXY(0, wCont, '________________________________________');
    Inc(wCont);
    wQuant := 0;
    DMOrdemServico.QOrdemServicoIt.First;
    while not DMOrdemServico.QOrdemServicoIt.Eof do
    begin
      wVlUnitario := DMOrdemServico.QOrdemServicoItVL_UNITARIO.Value;

      wQuant := wQuant + DMOrdemServico.QOrdemServicoItQT_PRODUTO.Value;
      //Imp.WriteXY(0,wCont,Bib.NumToTexto(DMOrdemServico.QOrdemServicoItQT_PRODUTO.Value,0,6));
      Imp.WriteXY(0, wCont, FormatFloat('0000', DMOrdemServico.QOrdemServicoItQT_PRODUTO.Value));
      Imp.WriteXY(1.2, wCont, Trim(DMOrdemServico.QOrdemServicoItCOD_PRODUTO.Text) + '-' + copy(Trim(DMOrdemServico.QOrdemServicoItnome_produto.Text), 1, 20));
      Inc(wCont);
      Imp.WriteXY(2, wCont, Bib.NumToTexto(wVlUnitario, 2, 10));
      Imp.WriteXY(4.2, wCont, Bib.NumToTexto(wVlUnitario * DMOrdemServico.QOrdemServicoItQT_PRODUTO.Value, 2, 10)); //Imp.WriteXY(4.2,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Total.Value, 2, 10));
      DMOrdemServico.QOrdemServicoIt.Next;
      Inc(wCont);
    end;
    Inc(wCont);
    Imp.WriteXY(0, wCont, '____________');
    Inc(wCont);
    Imp.WriteXY(0, wCont, Bib.NumToTexto(wQuant, 2, 10));
    Inc(wCont);
    Imp.WriteXY(0, wCont, 'SERVICO SOLICITADO: ');
    inc(wCont);
    n := 0;
    while n < Length(DMOrdemServico.QOrdemServicoDESC_EQUIPAMENTO.Text) do
    begin
      Imp.WriteXY(0, wCont, copy(DMOrdemServico.QOrdemServicoDESC_EQUIPAMENTO.Text, n + 1, 40));
      inc(n, 40);
      inc(wCont);
    end;
    n := 0;
    while n < Length(DMOrdemServico.QOrdemServicoDESC_SOLICITACAO.Text) do
    begin
      Imp.WriteXY(0, wCont, copy(DMOrdemServico.QOrdemServicoDESC_SOLICITACAO.Text, n + 1, 40));
      inc(n, 40);
      inc(wCont);
    end;

    Inc(wCont, 6);
    Imp.WriteXY(0, wCont, '');

    Imp.ConfiguraImpressora('CONDENSADO_OFF', 'SEXTOS', 66);
    Imp.FechaImpressora; // Finaliza os serviços de Impressao
  end;
end;

procedure TFOrdemServicoCad.Sada1Click(Sender: TObject);
begin
  inherited;
  if DMParamSistema.CodEmpresa = 'COPAGROL' then
  begin
    if FRSaida = nil then
      FRSaida := TFRSaida.Create(Application);
    with DMOrdemServico do
    begin
      if QOrdemServicoCOD_ORDEM_SERVICO_CAB.IsNull then
        raise Exception.Create('Selecione uma ordem de serviço!');
      QRSaida.Close;
      QRSaida.SetVariable('COD_ORDEM_SERVICO_CAB', QOrdemServicoCOD_ORDEM_SERVICO_CAB.Value);
      QRSaida.Open;
      QRSaidaItens.Close;
      QRSaidaItens.SetVariable('COD_ORDEM_SERVICO_CAB', QOrdemServicoCOD_ORDEM_SERVICO_CAB.Value);
      QRSaidaItens.Open;
      if (DMOrdemServico.QRSaidaDT_SAIDA.Value <> 0)
      or (MessageDlg('Ordem de Serviço ainda não foi fechada!'
      + #13 + 'Imprimir mesmo assim?', mtWarning, [mbYes, mbNo], 0) = mrYes) then
        FRSaida.QRPrimario.Preview;
    end;
  end
  else
  Begin
    if FROrdemServico_Saida = nil then
      FROrdemServico_Saida := TFROrdemServico_Saida.Create(Application);
    DMOrdemServico.QREntrada.Open;
  //  DMOrdemServico.QRSaida_Receber.Close;
  //  DMOrdemServico.QRSaida_Receber.Open;
    if (DMOrdemServico.QREntradaDt_Saida.Value <> 0)
      or (MessageDlg('Ordem de Serviço ainda não foi fechada!'
      + #13 + 'Imprimir mesmo assim?', mtWarning, [mbYes, mbNo], 0) = mrYes) then
      FROrdemServico_Saida.QRPrimario.Preview;
    DMOrdemServico.QREntrada.Close;
   // DMOrdemServico.QRSaida_Receber.Close;
 end;
end;

procedure TFOrdemServicoCad.RelSinttico1Click(Sender: TObject);
begin
  inherited;
  if FOrdemServicoParam = nil then
    FOrdemServicoParam := TFordemServicoParam.Create(Application);
  FOrdemServicoParam.PGRelatorio.Pages[0].TabVisible := True;
  if FOrdemServicoParam.ShowModal = mrOk then
    with DMOrdemServico do
    begin
      QRSintetico.Close;
      if Trim(FordemServicoParam.ME0DataI.Text) = '' then
        QRSintetico.SetVariable('DATA_I', Null)
      else
        QRSintetico.SetVariable('DATA_I', StrToDate(FordemServicoParam.ME0DataI.Text));
      if Trim(FordemServicoParam.ME0DataF.Text) = '' then
        QRSintetico.SetVariable('DATA_F', Null)
      else
        QRSintetico.SetVariable('DATA_F', StrToDate(FordemServicoParam.ME0DataF.Text));
      if Trim(FordemServicoParam.ME0DataIEntrada.Text) = '' then
        QRSintetico.SetVariable('DATA_I_ENTRADA', Null)
      else
        QRSintetico.SetVariable('DATA_I_ENTRADA', StrToDate(FordemServicoParam.ME0DataIEntrada.Text));
      if Trim(FordemServicoParam.ME0DataFEntrada.Text) = '' then
        QRSintetico.SetVariable('DATA_F_ENTRADA', Null)
      else
        QRSintetico.SetVariable('DATA_F_ENTRADA', StrToDate(FordemServicoParam.ME0DataFEntrada.Text));

    //Frames---------
      if Trim(FordemServicoParam.FmFilial1.MeFilial.Text) = '' then
        QRSintetico.SetVariable('FILIAL', Null)
      else
        QRSintetico.SetVariable('FILIAL', StrToFloat(Trim(FordemServicoParam.FmFilial1.MeFilial.Text)));

      if Trim(FordemServicoParam.FmCadastro1.MeCadastro.Text) = '' then
        QRSintetico.SetVariable('CADASTRO', Null)
      else
        QRSintetico.SetVariable('CADASTRO', StrToFloat(Trim(FordemServicoParam.FmCadastro1.MeCadastro.Text)));
      if Trim(FordemServicoParam.FmVeiculo1.MeVeiculo.Text) = '' then
        QRSintetico.SetVariable('VEICULO', Null)
      else
        QRSintetico.SetVariable('VEICULO', StrToFloat(Trim(FordemServicoParam.FmVeiculo1.MeVeiculo.Text)));
      if Trim(FordemServicoParam.ME0Placa.Text) = '-' then
        QRSintetico.SetVariable('PLACA', Null)
      else
        QRSintetico.SetVariable('PLACA', Bib.LimpaString(FordemServicoParam.ME0Placa.Text, '-'));
      if Trim(FordemServicoParam.FmVendedor1.MeVendedor.Text) = '' then
        QRSintetico.SetVariable('VENDEDOR', Null)
      else
        QRSintetico.SetVariable('VENDEDOR', StrToFloat(Trim(FordemServicoParam.FmVendedor2.MeVendedor.Text)));
      if Trim(FordemServicoParam.FmTecnico1.MeVendedor.Text) = '' then
        QRSintetico.SetVariable('TECNICO', Null)
      else
        QRSintetico.SetVariable('TECNICO', StrToFloat(Trim(FordemServicoParam.FmTecnico1.MeVendedor.Text)));
      if Trim(FordemServicoParam.FmSupervisor1.MeVendedor.Text) = '' then
        QRSintetico.SetVariable('SUPERVISOR', Null)
      else
        QRSintetico.SetVariable('SUPERVISOR', StrToFloat(Trim(FordemServicoParam.FmSupervisor1.MeVendedor.Text)));
      if Trim(FOrdemServicoParam.FmProduto1.MeProduto.Text) = '' then
        QRSintetico.SetVariable(':PRODUTO',null)
      else
        QRSintetico.SetVariable(':PRODUTO',StrToInt(Trim(FOrdemServicoParam.FmProduto1.MeProduto.Text)));

      if (DMParamSistema.CodEmpresa <> 'GEOPRO') then
      begin
        case FOrdemServicoParam.RGSituacaoOrdemSintetico.ItemIndex of
          0: QRSintetico.SetVariable('IND_SITUACAO_OS', Null);
          1: begin
            QRSintetico.SetVariable('IND_SITUACAO_OS', 'ABERTA');
            QRSintetico.SetVariable('DATA_I', Null);
            QRSintetico.SetVariable('DATA_F', Null);
            FOrdemServicoParam.ME0DataI.Text := '';
            FOrdemServicoParam.ME0DataF.Text := '';
          end;
          2: QRSintetico.SetVariable('IND_SITUACAO_OS', 'FECHADA');
          else raise Exception.Create('Situação Inválida!');
        end;
      end
      else
      begin
        case FOrdemServicoParam.RGSituacaoOrdemSintetico.ItemIndex of
          0: begin
               QRSintetico.SetVariable('IND_SITUACAO_OS', 'ABERTA');
               QRSintetico.SetVariable('DATA_I', Null);
               QRSintetico.SetVariable('DATA_F', Null);
               QRSintetico.SetVariable('DATA_I_ENTRADA', FOrdemServicoParam.ME0DataIEntrada.Text);
               QRSintetico.SetVariable('DATA_F_ENTRADA', FOrdemServicoParam.ME0DataFEntrada.Text);
             end;
          1: begin
               QRSintetico.SetVariable('IND_SITUACAO_OS', 'ARQUIVADA');
               QRSintetico.SetVariable('DATA_I', Null);
               QRSintetico.SetVariable('DATA_F', Null);
               QRSintetico.SetVariable('DATA_I_ENTRADA', FOrdemServicoParam.ME0DataIEntrada.Text);
               QRSintetico.SetVariable('DATA_F_ENTRADA', FOrdemServicoParam.ME0DataFEntrada.Text);
             end;
          2: begin
               QRSintetico.SetVariable('IND_SITUACAO_OS', 'CORTESIA');
               QRSintetico.SetVariable('DATA_I', FOrdemServicoParam.ME0DataI.Text);
               QRSintetico.SetVariable('DATA_F', FOrdemServicoParam.ME0DataF.Text);
               QRSintetico.SetVariable('DATA_I_ENTRADA', FOrdemServicoParam.ME0DataIEntrada.Text);
               QRSintetico.SetVariable('DATA_F_ENTRADA', FOrdemServicoParam.ME0DataFEntrada.Text);
             end;
          3: begin
               QRSintetico.SetVariable('IND_SITUACAO_OS', 'FECHADA');
               QRSintetico.SetVariable('DATA_I', FOrdemServicoParam.ME0DataI.Text);
               QRSintetico.SetVariable('DATA_F', FOrdemServicoParam.ME0DataF.Text);
               QRSintetico.SetVariable('DATA_I_ENTRADA', FOrdemServicoParam.ME0DataIEntrada.Text);
               QRSintetico.SetVariable('DATA_F_ENTRADA', FOrdemServicoParam.ME0DataFEntrada.Text);
             end;
          4: begin
               QRSintetico.SetVariable('IND_SITUACAO_OS', 'FINALIZADA');
               QRSintetico.SetVariable('DATA_I', FOrdemServicoParam.ME0DataI.Text);
               QRSintetico.SetVariable('DATA_F', FOrdemServicoParam.ME0DataF.Text);
               QRSintetico.SetVariable('DATA_I_ENTRADA', FOrdemServicoParam.ME0DataIEntrada.Text);
               QRSintetico.SetVariable('DATA_F_ENTRADA', FOrdemServicoParam.ME0DataFEntrada.Text);
             end;
          5: begin
               QRSintetico.SetVariable('IND_SITUACAO_OS', Null);
               QRSintetico.SetVariable('DATA_I', Null);
               QRSintetico.SetVariable('DATA_F', Null);
               QRSintetico.SetVariable('DATA_I_ENTRADA', FOrdemServicoParam.ME0DataIEntrada.Text);
               QRSintetico.SetVariable('DATA_F_ENTRADA', FOrdemServicoParam.ME0DataFEntrada.Text);
             end;
        end;
      end;

      QRSintetico.SQL[QRSintetico.SQL.Count - 1] := ''; //SERVE PARA EXCUIR A ULTIMA LINHA DA SQL NA QUERY
      if FOrdemServicoParam.CB01Ordem.itemIndex = 0 then
        QRSintetico.Sql.Add(' ORDER BY TB_CADASTRO.NOME')
      else
        if FOrdemServicoParam.CB01Ordem.ItemIndex = 1 then
          QRSintetico.SQL.Add(' ORDER BY TB_ORDEM_SERVICO_CAB.COD_ORDEM_SERVICO_CAB')
        else
          QRSintetico.SQL.Add(' ORDER BY TB_ORDEM_SERVICO_CAB.DT_SAIDA');
    //--------------
      QRSintetico.Open;
      if FROrdemServico_Sintetico = nil then
        FROrdemServico_Sintetico := TFROrdemServico_Sintetico.Create(Application);

      FROrdemServico_Sintetico.QRLPeriodoEntrada.Caption := 'Período de Entrada: ' + FOrdemServicoParam.ME0DataIEntrada.Text + ' a ' + FOrdemServicoParam.ME0DataFEntrada.Text;
      FROrdemServico_Sintetico.QRLPeriodoSaida.Caption := 'Período de Saída:   ' + FOrdemServicoParam.ME0DataI.Text + ' a ' + FOrdemServicoParam.ME0DataF.Text;

      FROrdemServico_Sintetico.QRLabel10.Caption := 'Saída';
      FROrdemServico_Sintetico.QRDBText8.DataField := 'DT_SAIDA';

      if (DMParamSistema.CodEmpresa <> 'GEOPRO') then
      begin
        case FOrdemServicoParam.RGSituacaoOrdemSintetico.ItemIndex of
          0: FROrdemServico_Sintetico.QRLIndSituacaoOS.Caption := 'Situação : TODAS';
          1: begin
              FROrdemServico_Sintetico.QRLIndSituacaoOS.Caption := 'Situação : ABERTAS';
              FROrdemServico_Sintetico.QRLabel10.Caption := 'Entrada';
              FROrdemServico_Sintetico.QRDBText8.DataField := 'DT_ENTRADA';
            end;
          2: FROrdemServico_Sintetico.QRLIndSituacaoOS.Caption := 'Situação : FECHADAS';
          else raise Exception.Create('Situação Inválida!');
        end;
        end
        else
        begin
          case FOrdemServicoParam.RGSituacaoOrdemSintetico.ItemIndex of
          0: begin
              FROrdemServico_Sintetico.QRLIndSituacaoOS.Caption := 'Situação : ABERTAS';
              FROrdemServico_Sintetico.QRLabel10.Caption := 'Entrada';
              FROrdemServico_Sintetico.QRDBText8.DataField := 'DT_ENTRADA';
             end;
          1: begin
              FROrdemServico_Sintetico.QRLIndSituacaoOS.Caption := 'Situação : ARQUIVADAS';
              FROrdemServico_Sintetico.QRLabel10.Caption := 'Entrada';
              FROrdemServico_Sintetico.QRDBText8.DataField := 'DT_ENTRADA';
             end;
          2: begin
              FROrdemServico_Sintetico.QRLIndSituacaoOS.Caption := 'Situação : CORTESIA';
              FROrdemServico_Sintetico.QRLabel10.Caption := 'Entrada';
              FROrdemServico_Sintetico.QRDBText8.DataField := 'DT_ENTRADA';
             end;
          3: begin
              FROrdemServico_Sintetico.QRLIndSituacaoOS.Caption := 'Situação : FECHADA';
              FROrdemServico_Sintetico.QRLabel10.Caption := 'Saída';
              FROrdemServico_Sintetico.QRDBText8.DataField := 'DT_SAIDA';
             end;
          4: begin
              FROrdemServico_Sintetico.QRLIndSituacaoOS.Caption := 'Situação : FINALIZADA';
              FROrdemServico_Sintetico.QRLabel10.Caption := 'Entrada';
              FROrdemServico_Sintetico.QRDBText8.DataField := 'DT_ENTRADA';
             end;
          5: begin
              FROrdemServico_Sintetico.QRLIndSituacaoOS.Caption := 'Situação : TODAS';
              FROrdemServico_Sintetico.QRLabel10.Caption := 'Entrada';
              FROrdemServico_Sintetico.QRDBText8.DataField := 'DT_ENTRADA';
             end;
        end;
      end;

      if FOrdemServicoParam.RGPreview.ItemIndex = 0 then
        FROrdemServico_Sintetico.QRPrimario.Preview
      else
        FROrdemServico_Sintetico.QRPrimario.Print;
      QRSintetico.Close;
    end;
end;

procedure TFOrdemServicoCad.RelAnaltico1Click(Sender: TObject);
begin
  inherited;
  if FOrdemServicoParam = nil then
    FOrdemServicoParam := TFordemServicoParam.Create(Application);
  FOrdemServicoParam.PGRelatorio.Pages[1].TabVisible := True;
  if FOrdemServicoParam.ShowModal = mrOk then
    with DMOrdemServico do
    begin
      QRAnalitico.Close;
{Data de Saida}
      if Trim(FordemServicoParam.ME1DataI.Text) = '' then
        QRAnalitico.SetVariable('DATA_I', Null)
      else
        QRAnalitico.SetVariable('DATA_I', StrToDate(FordemServicoParam.ME1DataI.Text));

      if Trim(FordemServicoParam.ME1DataF.Text) = '' then
        QRAnalitico.SetVariable('DATA_F', Null)
      else
        QRAnalitico.SetVariable('DATA_F', StrToDate(FordemServicoParam.ME1DataF.Text));
{Fim data de Saida}
{Data Entrada}
      if Trim(FordemServicoParam.ME1DataIEntrada.Text) = '' then
        QRAnalitico.SetVariable('DATA_I_ENTRADA', Null)
      else
        QRAnalitico.SetVariable('DATA_I_ENTRADA', StrToDate(FordemServicoParam.ME1DataIEntrada.Text));

      if Trim(FordemServicoParam.ME1DataFEntrada.Text) = '' then
        QRAnalitico.SetVariable('DATA_F_ENTRADA', Null)
      else
        QRAnalitico.SetVariable('DATA_F_ENTRADA', StrToDate(FordemServicoParam.ME1DataFEntrada.Text));
{Fim Data Entrada}
    //Frames-------
      if Trim(FordemServicoParam.FmFilial2.MeFilial.Text) = '' then
        QRAnalitico.SetVariable('FILIAL', Null)
      else
        QRAnalitico.SetVariable('FILIAL', StrToFloat(Trim(FordemServicoParam.FmFilial2.MeFilial.Text)));
      if Trim(FordemServicoParam.FmCadastro2.MeCadastro.Text) = '' then
        QRAnalitico.SetVariable('CADASTRO', Null)
      else
        QRAnalitico.SetVariable('CADASTRO', StrToFloat(Trim(FordemServicoParam.FmCadastro2.MeCadastro.Text)));
      if Trim(FordemServicoParam.FmVeiculo2.MeVeiculo.Text) = '' then
        QRAnalitico.SetVariable('VEICULO', Null)
      else
        QRAnalitico.SetVariable('VEICULO', StrToFloat(Trim(FordemServicoParam.FmVeiculo2.MeVeiculo.Text)));
      if Trim(FordemServicoParam.ME1Placa.Text) = '-' then
        QRAnalitico.SetVariable('PLACA', Null)
      else
        QRAnalitico.SetVariable('PLACA', Bib.LimpaString(FordemServicoParam.ME1Placa.Text, '-'));
      if Trim(FordemServicoParam.FmProduto2.MeProduto.Text) = '' then
        QRAnalitico.SetVariable('COD_PRODUTO', Null)
      else
        QRAnalitico.SetVariable('COD_PRODUTO', StrToFloat(Trim(FordemServicoParam.FmProduto2.MeProduto.Text)));
      if trim(FOrdemServicoParam.FmVendedor1.MeVendedor.Text) = '' then
        QRAnalitico.SetVariable('VENDEDOR', Null)
      else
        QRAnalitico.SetVariable('VENDEDOR', StrToFloat(trim(FOrdemServicoParam.FmVendedor1.MeVendedor.Text)));
      if trim(FOrdemServicoParam.FmTecnico2.MeVendedor.Text) = '' then
        QRAnalitico.SetVariable('TECNICO', Null)
      else
        QRAnalitico.SetVariable('TECNICO', StrToFloat(trim(FOrdemServicoParam.FmTecnico2.MeVendedor.Text)));
      if trim(FOrdemServicoParam.FmSupervisor2.MeVendedor.Text) = '' then
        QRAnalitico.SetVariable('SUPERVISOR', Null)
      else
        QRAnalitico.SetVariable('SUPERVISOR', StrToFloat(trim(FOrdemServicoParam.FmSupervisor2.MeVendedor.Text)));
      if trim(FOrdemServicoParam.FmOperacao2.MeOperacao.Text) = '' then
        QRAnalitico.SetVariable('OPERACAO', Null)
      else
        QRAnalitico.SetVariable('OPERACAO', StrToInt(trim(FOrdemServicoParam.FmOperacao2.MeOperacao.Text)));
      if trim(FOrdemServicoParam.MeModelo.Text) = '' then
        QRAnalitico.SetVariable('COD_MODELO', Null)
      else
        QRAnalitico.SetVariable('COD_MODELO', StrToFloat(trim(FOrdemServicoParam.MeModelo.Text)));

      case FOrdemServicoParam.RGSituacaoOrdem.ItemIndex of
        0: QRAnalitico.SetVariable('IND_SITUACAO_OS', Null);
        1: begin
            QRAnalitico.SetVariable('IND_SITUACAO_OS', 'ABERTA');
            QRAnalitico.SetVariable('DATA_I', Null);
            QRAnalitico.SetVariable('DATA_F', Null);
            FOrdemServicoParam.ME1DataI.Text := '';
            FOrdemServicoParam.ME1DataF.Text := '';
          end;
        2: QRAnalitico.SetVariable('IND_SITUACAO_OS', 'FECHADA')
        else raise Exception.Create('Situação Inválida!');
      end;

      QRAnalitico.SQL[QRAnalitico.SQL.Count - 1] := ''; //SERVE PARA EXCUIR A ULTIMA LINHA DA SQL NA QUERY
      if FOrdemServicoParam.CB02Ordem.itemIndex = 0 then
//        QRAnalitico.Sql.Add(' ORDER BY TB_ORDEM_SERVICO_CAB.COD_ORDEM_SERVICO_CAB, TB_CADASTRO.NOME, TB_ORDEM_SERVICO_ITEM.COD_ORDEM_SERVICO_ITEM')
        QRAnalitico.Sql.Add('  ORDER BY TB_CADASTRO.NOME')
      else if FOrdemServicoParam.CB02Ordem.ItemIndex = 1 then
        QRAnalitico.SQL.Add(' ORDER BY TB_ORDEM_SERVICO_CAB.COD_ORDEM_SERVICO_CAB, TB_ORDEM_SERVICO_ITEM.COD_ORDEM_SERVICO_ITEM')
      else
        QRAnalitico.SQL.Add(' ORDER BY TB_ORDEM_SERVICO_CAB.COD_ORDEM_SERVICO_CAB, TB_ORDEM_SERVICO_CAB.DT_SAIDA, TB_ORDEM_SERVICO_ITEM.COD_ORDEM_SERVICO_ITEM');
    //------------

      QRAnalitico.Open;

      if FROrdemServico_Analitico = nil then
        FROrdemServico_Analitico := TFROrdemServico_Analitico.Create(Application);
      FROrdemServico_Analitico.QRLPeriodoEntrada.Caption := 'Período de Entrada: ' + FOrdemServicoParam.ME1DataIEntrada.Text + ' a ' + FOrdemServicoParam.ME1DataFEntrada.Text;
      FROrdemServico_Analitico.QRLPeriodoSaida.Caption := 'Período de Saída:   ' + FOrdemServicoParam.ME1DataI.Text + ' a ' + FOrdemServicoParam.ME1DataF.Text;

      case FOrdemServicoParam.RGSituacaoOrdem.ItemIndex of
        0: begin
          FROrdemServico_Analitico.QRLIndSituacaoOS.Caption := 'Situação : TODAS';
          end;
        1: begin
          FROrdemServico_Analitico.QRLIndSituacaoOS.Caption := 'Situação : ABERTAS';
          end;
        2: begin
          FROrdemServico_Analitico.QRLIndSituacaoOS.Caption := 'Situação : FECHADAS';
          end;
      end;

      if FOrdemServicoParam.RGPreview.ItemIndex = 0 then
        FROrdemServico_Analitico.QRPrimario.Preview
      else
        FROrdemServico_Analitico.QRPrimario.Print;
      QRAnalitico.Close;
      if (DMParamSistema.CodEmpresa = 'FURGOESMED') then
       RelAnaltico1Click(Sender);
    end;
end;

procedure TFOrdemServicoCad.MdiaAtendimento1Click(Sender: TObject);
begin
  inherited;
  if FOrdemServicoParam = nil then
    FOrdemServicoParam := TFordemServicoParam.Create(Application);
  FOrdemServicoParam.PGRelatorio.Pages[2].TabVisible := True;
  if FOrdemServicoParam.ShowModal = mrOk then
    with DMOrdemServico do
    begin
      QRMedia.Close;
      if DMParamSistema.CodEmpresa = 'GEOPRO' then
      begin
        QRMedia.SetVariable('DATA_I', null);
        QRMedia.SetVariable('DATA_F', null);
        QRMedia.SetVariable('DATA_I_OS', StrToDate(FordemServicoParam.ME2DataI.Text));
        QRMedia.SetVariable('DATA_F_OS', StrToDate(FordemServicoParam.ME2DataF.Text));
        QRMedia.SetVariable('IND_SITUACAO', 'FINALIZADA');
      end
      else
      begin
        QRMedia.SetVariable('DATA_I', StrToDate(FordemServicoParam.ME2DataI.Text));
        QRMedia.SetVariable('DATA_F', StrToDate(FordemServicoParam.ME2DataF.Text));
        QRMedia.SetVariable('DATA_I_OS', null);
        QRMedia.SetVariable('DATA_F_OS', null);
      end;
    //Frames-------
      if Trim(FordemServicoParam.FmFilial3.MeFilial.Text) = '' then
        QRMedia.SetVariable('FILIAL', Null)
      else
        QRMedia.SetVariable('FILIAL', StrToFloat(Trim(FordemServicoParam.FmFilial3.MeFilial.Text)));
    //-------------
       QRMedia.SQL[QRMedia.SQL.Count - 1] := ''; //SERVE PARA EXCUIR A ULTIMA LINHA DA SQL NA QUERY
      if FOrdemServicoParam.CB03Ordem.itemIndex = 0 then
        QRMedia.Sql.Add(' ORDER BY NOME');
      if FOrdemServicoParam.CB03Ordem.ItemIndex = 1 then
          QRMedia.SQL.Add(' ORDER BY COD_ORDEM_SERVICO_CAB');
      if FOrdemServicoParam.CB03Ordem.ItemIndex = 2 then
          QRMedia.SQL.Add( 'ORDER BY DT_ENTRADA');
      if FOrdemServicoParam.CB03Ordem.ItemIndex = 3 then
          QRMedia.SQL.Add(' ORDER BY DT_SAIDA');

      QRMedia.Open;
      if FROrdemServico_Media = nil then
        FROrdemServico_Media := TFROrdemServico_Media.Create(Application);
      if DMParamSistema.CodEmpresa = 'GEOPRO' then
      begin
        FROrdemServico_Media.QRDBText1.DataField := 'DT_ENTRADA_MANUTENCAO';
        FROrdemServico_Media.QRDBText2.DataField := 'DT_SAIDA_MANUTENCAO';
        FROrdemServico_Media.QRLabel5.Caption := 'Início';
        FROrdemServico_Media.QRLabel6.Caption := 'Fim';
      end;
      if FOrdemServicoParam.RGPreview.ItemIndex = 0 then
        FROrdemServico_Media.QRPrimario.Preview
      else
        FROrdemServico_Media.QRPrimario.Print;
      QRMedia.Close;
    end;
end;

procedure TFOrdemServicoCad.Recibo1Click(Sender: TObject);
begin
  inherited;
  if FReciboParam = nil then
    FReciboParam := TFReciboParam.Create(Application);
  FReciboParam.ShowModal;
end;

procedure TFOrdemServicoCad.OSemAberto1Click(Sender: TObject);
begin
  inherited;
  if FOrdemServicoParam = nil then
    FOrdemServicoParam := TFordemServicoParam.Create(Application);
  FOrdemServicoParam.PGRelatorio.Pages[3].TabVisible := True;
  if FOrdemServicoParam.ShowModal = mrOk then
    with DMOrdemServico do
    begin
      QRAberto.Close;
    //Frames---------
      if Trim(FordemServicoParam.FmFilial4.MeFilial.Text) = '' then
        QRAberto.SetVariable('FILIAL', Null)
      else
        QRAberto.SetVariable('FILIAL', StrToFloat(Trim(FordemServicoParam.FmFilial4.MeFilial.Text)));

      if Trim(FordemServicoParam.FmCadastro4.MeCadastro.Text) = '' then
        QRAberto.SetVariable('CADASTRO', Null)
      else
        QRAberto.SetVariable('CADASTRO', StrToFloat(Trim(FordemServicoParam.FmCadastro4.MeCadastro.Text)));

      if Trim(FordemServicoParam.FmVendedor4.MeVendedor.Text) = '' then
        QRAberto.SetVariable('VENDEDOR', Null)
      else
        QRAberto.SetVariable('VENDEDOR', StrToFloat(Trim(FordemServicoParam.FmVendedor4.MeVendedor.Text)));

      if Trim(FordemServicoParam.FmTecnico.MeVendedor.Text) = '' then
        QRAberto.SetVariable('TECNICO', Null)
      else
        QRAberto.SetVariable('TECNICO', StrToFloat(Trim(FordemServicoParam.FmTecnico.MeVendedor.Text)));

    //---------------
      if Trim(FOrdemServicoParam.Me3DataI.Text) <> '' then
        QRAberto.SetVariable('DATA_I', StrToDate(FordemServicoParam.ME3DataI.Text))
      else
        QRAberto.SetVariable('DATA_I', Null);
      if Trim(FOrdemServicoParam.Me3DataF.Text) <> '' then
        QRAberto.SetVariable('DATA_F', StrToDate(FordemServicoParam.ME3DataF.Text))
      else
        QRAberto.SetVariable('DATA_F',Null);
      //------DT FECHAMENTO----
      if Trim(FOrdemServicoParam.Me3DataFI.Text) <> '' then
        QRAberto.SetVariable('DATA_IF', StrToDate(FOrdemServicoParam.Me3DataFI.Text))
      else
        QRAberto.SetVariable('DATA_IF', Null);
      if Trim(FOrdemServicoParam.Me3DataFF.Text) <> '' then
        QRAberto.SetVariable('DATA_FF', StrToDate(FOrdemServicoParam.Me3DataFF.Text))
      else
        QRAberto.SetVariable('DATA_FF', Null);


      if DMParamSistema.CodEmpresa = 'GEOPRO' then
      begin
        if FordemServicoParam.RGSituacaoOS3.ItemIndex = 0 then
          QRAberto.SetVariable('IND_SITUACAO_OS', 'ABERTA');
        if FordemServicoParam.RGSituacaoOS3.ItemIndex = 1 then
          QRAberto.SetVariable('IND_SITUACAO_OS', 'ARQUIVADA');
        if FordemServicoParam.RGSituacaoOS3.ItemIndex = 2 then
          QRAberto.SetVariable('IND_SITUACAO_OS', 'CORTESIA');
        if FordemServicoParam.RGSituacaoOS3.ItemIndex = 3 then
          QRAberto.SetVariable('IND_SITUACAO_OS', 'FECHADA');
        if FordemServicoParam.RGSituacaoOS3.ItemIndex = 4 then
          QRAberto.SetVariable('IND_SITUACAO_OS', 'FINALIZADA');
        if FordemServicoParam.RGSituacaoOS3.ItemIndex = 5 then
          QRAberto.SetVariable('IND_SITUACAO_OS', null);
      end
      else
      if (DMParamSistema.CodEmpresa = 'CENTERFRIO') or (DMParamSistema.CodEmpresa = 'NIR') then
      begin
        if FordemServicoParam.RGSituacaoOS3.ItemIndex = 0 then
          QRAberto.SetVariable('IND_SITUACAO_OS', 'ABERTA');
        if FordemServicoParam.RGSituacaoOS3.ItemIndex = 1 then
          QRAberto.SetVariable('IND_SITUACAO_OS', 'FECHADA');
        if FordemServicoParam.RGSituacaoOS3.ItemIndex = 2 then
          QRAberto.SetVariable('IND_SITUACAO_OS', 'GARANTIA');
        if FordemServicoParam.RGSituacaoOS3.ItemIndex = 3 then
          QRAberto.SetVariable('IND_SITUACAO_OS', null);
      end
      else
      begin
        if FordemServicoParam.RGOpcaoBaixa3.ItemIndex = 0 then
          QRAberto.SetVariable('IND_BAIXADA', null);
        if FordemServicoParam.RGOpcaoBaixa3.ItemIndex = 1 then
          QRAberto.SetVariable('IND_BAIXADA', 'NAO');
        if FordemServicoParam.RGOpcaoBaixa3.ItemIndex = 2 then
          QRAberto.SetVariable('IND_BAIXADA', 'SIM');
      end;
      QRAberto.SQL[QRAberto.SQL.Count - 1] := ''; //SERVE PARA EXCUIR A ULTIMA LINHA DA SQL NA QUERY
      if FOrdemServicoParam.CB04Ordem.itemIndex = 0 then
        QRAberto.Sql.Add(' ORDER BY NOME_CLIENTE')
      else
        if FOrdemServicoParam.CB04Ordem.ItemIndex = 1 then
          QRAberto.SQL.Add(' ORDER BY COD_ORDEM_SERVICO_CAB')
        else
          QRAberto.SQL.Add(' ORDER BY DT_ENTRADA');

      QRAberto.Open;
      if FROrdemServico_Aberto = nil then
        FROrdemServico_Aberto := TFROrdemServico_Aberto.Create(Application);
      FROrdemServico_Aberto.QRLTitulo.Caption := 'Assistencia Tecnica de ' + FordemServicoParam.ME3DataI.Text + ' até ' + FordemServicoParam.ME3DataF.Text;
      if FOrdemServicoParam.RGPreview.ItemIndex = 0 then
        FROrdemServico_Aberto.QRPrimario.Preview
      else
        FROrdemServico_Aberto.QRPrimario.Print;
      QRAberto.Close;
    end;
end;

procedure TFOrdemServicoCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  SBFechaOS.Enabled := DMOrdemServico.QOrdemServico.State = dsBrowse;
  DBPLote.Enabled := not SBFechaOS.Enabled;
  DBPTributacao.Enabled := not SBFechaOS.Enabled;
  DBPTabelaPreco.Enabled := not SBFechaOS.Enabled;
  CBSenha.Enabled := (DSPrimario.State in [DsEdit, DsInsert]);
  if DMParamSistema.CodEmpresa <> 'NIR' then
    SBVeiculo.Enabled := (DSPrimario.State in [DsEdit, DsInsert]);
  IniciarManuteno1.Enabled := (DSPrimario.State in [dsBrowse]);
  FinalizarServio1.Enabled := (DSPrimario.State in [dsBrowse]);
  if DSPrimario.State in [DsInsert] then
     CBSenha.State := cbUnchecked;
  if DSPrimario.State in [DsEdit, DsInsert] then
  begin
    MMCadSimples.Items[2].Items[0].Enabled := false;
    MMCadSimples.Items[2].Items[1].Enabled := false;
    MMCadSimples.Items[2].Items[2].Enabled := false;
  end
  else
  begin
    with DMOrdemServico do
    begin
      if QOrdemServicoDT_SAIDA.Value > 0 then
      begin
        MMCadSimples.Items[2].Items[0].Enabled := false;
        MMCadSimples.Items[2].Items[1].Enabled := true;
        MMCadSimples.Items[2].Items[2].Enabled := true;
        SBFechaOS.Enabled := false;
      end
      else
      begin
        MMCadSimples.Items[2].Items[0].Enabled := true;
        MMCadSimples.Items[2].Items[1].Enabled := false;
        MMCadSimples.Items[2].Items[2].Enabled := true;
        SBFechaOS.Enabled := true;
      end;
      if QOrdemServicoIND_SITUACAO_OS.Text = 'FINALIZADA' then
        MMCadSimples.Items[2].Items[5].Enabled := False
      else
        MMCadSimples.Items[2].Items[5].Enabled := True;
    end;
  end;
  DSItensStateChange(Sender);

  //solicitado pelos técnicos da manutenção - Gian 31/08/2017
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'NIR' then
  begin
    if DMOrdemServico.QOrdemServicoDT_ENTRADA_MANUTENCAO.IsNull then
      IniciarManuteno1.Enabled := True
    else
      IniciarManuteno1.Enabled := False;

    if DMOrdemServico.QOrdemServicoDT_SAIDA_MANUTENCAO.IsNull then
      FinalizarServio1.Enabled := True
    else
      FinalizarServio1.Enabled := False;
  end;

  AtivaDesativaAPI;
end;

procedure TFOrdemServicoCad.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpContext(2);
end;

procedure TFOrdemServicoCad.VoltarOS1Click(Sender: TObject);
var
  wDtCaixa: TDate;
  wVal, wNN: string;
begin
  inherited;
{Adicionado para quando for cancelado o pagamento por PIX realizar a volta da O.S. sem perguntar. Alex 10/03/2025}  
  if fPixDadosStatus.EmErro <> true then
  begin
    if messageDlg('Deseja realmente voltar essa O.S.?', mtConfirmation, [mbyes, mbno], 0) <> mryes then
      Abort
  end;
  FOrdemServicoFecha.LimpaStatusPix(fPixDadosStatus);
  if DMOrdemServico.QOrdemServico.RecordCount <= 0 then
    raise Exception.create('Não existe nenhuma Ordem de Serviço selecionada.');
  if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'TRENTO')then
  begin
    if FSenha = nil then
      FSenha := TFSenha.Create(Application);
    if FSenha.ShowModal = MrOk then
    begin
      if UpperCase(Trim(FSenha.EdSenha.Text)) <> UpperCase(DmParamSistema.QParamSistemaDesc_Senha_Oficina.Value) then
        raise Exception.Create('Usuário sem permissão!');
    end
    else
      Abort;
  end;
  DMOracle.DBCemapa.StartTransaction;
  try
    if DMOrdemServico.QOrdemServicoDt_Saida.Text = '' then
      raise Exception.Create('Ordem de Serviço não está fechada');

    if not DMOrdemServico.QOrdemServicoCOD_CAIXA.IsNull then
    begin
      wVal := DMOracle.BuscaNome('SELECT DT_MOVIMENTO FROM TB_CAIXA_MOV', 'COD_CAIXA_MOV = ' + DMOrdemServico.QOrdemServicoCOD_CAIXA.Text);
      if wVal <> '' then
      begin
        wDtCaixa := StrToDate(wVal);
        if wDtCaixa <= DMParamSistema.QParamSistemaDT_FECHAMENTO_SISTEMA.Value then
          raise Exception.Create('Volta não permitida. Fechamento do sistema.');
      end;
{Alterado para apagar pelo cod_ordem_servico_cab, pois quando havia valor de entrada lançado no caixa, este não apagava. Alex 07/11/2025
      DMOracle.QExecSQL.close;
      DMOracle.QExecSQL.SQL.Clear;
      DMOracle.QExecSQL.SQL.Add('DELETE FROM TB_CAIXA_MOV WHERE COD_CAIXA_MOV = ' + DMOrdemServico.QOrdemServicoCOD_CAIXA.Text);
      DMOracle.QExecSQL.ExecSQL; }
      DMOracle.QExecSQL.close;
      DMOracle.QExecSQL.SQL.Clear;
      DMOracle.QExecSQL.SQL.Add('DELETE FROM TB_CAIXA_MOV WHERE COD_ORDEM_SERVICO_CAB = ' + DMOrdemServico.QOrdemServicoCOD_ORDEM_SERVICO_CAB.Text);
      DMOracle.QExecSQL.ExecSQL;
    end;

    //verifica se foi feita alguma baixa do contas a receber, se foi dado baixa retorna um erro
    wVal := DMOracle.BuscaNome(' SELECT COUNT(TB_CONTA_RECEBER_CAB.COD_CONTA_RECEBER_CAB) FROM ' +
      ' TB_CONTA_RECEBER_CAB, TB_CONTA_RECEBER_MOV ',
      ' TB_CONTA_RECEBER_CAB.COD_CONTA_RECEBER_CAB = TB_CONTA_RECEBER_MOV.COD_CONTA_RECEBER_CAB ' +
      ' AND TB_CONTA_RECEBER_CAB.COD_ORDEM_SERVICO_CAB = ' + DMOrdemServico.QOrdemServicoCOD_ORDEM_SERVICO_CAB.Text +
      ' AND TB_CONTA_RECEBER_MOV.IND_TIPO_MOVIMENTO <> ' + AnsiQuotedStr('PRINCIPAL', CHR(39)));

    if wVal <> '' then
      if StrToInt(wVal) > 0 then
        raise Exception.Create('Volta não permitida. Contas a Receber com baixas');

    //verifica se há boletos gerados
    wNN := DMOracle.BuscaNome(' SELECT COUNT(TB_CONTA_RECEBER_CAB.cod_conta_receber_cab) FROM ' +
      ' TB_CONTA_RECEBER_CAB ',
      ' TB_CONTA_RECEBER_CAB.COD_ORDEM_SERVICO_CAB = ' + DMOrdemServico.QOrdemServicoCOD_ORDEM_SERVICO_CAB.Text +
      ' AND TB_CONTA_RECEBER_CAB.COD_NOSSO_NUMERO > 0');
    if (strtoint(wNN) > 0) then
    begin
      if MessageDlg('CUIDADO!' + chr(13) + 'Ordem de Serviço com boletos emitidos.' + chr(13) +
        'Se voltar, os boletos serão excluídos do Sistema.' +
        Chr(13)+ 'Deseja realmente voltar?', mtConfirmation , [mbyes,mbno],0) = mrno then
        exit;
    end;

    //------------------------------------------------
    //Atualizar Estoque - Modificado 12/03/2008 - Camila.
    DMOrdemServico.QOrdemServicoIt.First;
    while not DMOrdemServico.QOrdemServicoIt.Eof do
    begin
      if DMOracle.BuscaNome('SELECT IND_TIPO_PRODUTO FROM TB_PRODUTO', 'COD_PRODUTO = ' + DMOrdemServico.QOrdemServicoItCod_Produto.Text) <> 'SERVIÇO' then
        DMEstoque.AtualizaEstoque(
          DMOrdemServico.QOrdemServicoCOD_OPERACAO.Value, //Passava-se (-2), agora COD_OPERACAO. Alteração necessária para Procedure basear-se tbm na operação quando for baixar estoque. Mais detalhes, na própria procedure em DMEstoque.AtualizaEstoque.
          DMOrdemServico.QOrdemServicoCOD_FILIAL.Value,
          DMOrdemServico.QOrdemServicoItCOD_PRODUTO.Value, 1,
          DMOrdemServico.QOrdemServicoItQT_PRODUTO.Value * 1,
          DMOrdemServico.QOrdemServicoItvl_total.Value * 1, 0, DMOrdemServico.QOrdemServicoDT_SAIDA.Value);
      DMOrdemServico.QOrdemServicoIt.Next;
    end;
    //-------------------------------------------------
    //QOrdemServico.Post;
    //---------------------

    //na encopel nao é gerado contas a receber pela requisição, entao nao precisa voltar por aqui.
    Executador.Limpa;
    if DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'ENCOPEL' then
    begin
      Executador.Adiciona(MontaDelete('TB_CONTA_RECEBER_MOV',
        'COD_CONTA_RECEBER_CAB IN ( ' + MontaSelect('COD_CONTA_RECEBER_CAB ',
        'TB_CONTA_RECEBER_CAB', 'COD_ORDEM_SERVICO_CAB = ' +
        DMOrdemServico.QOrdemServicoCOD_ORDEM_SERVICO_CAB.Text + ' ) ')));

      Executador.Adiciona(MontaDelete('TB_CONTA_RECEBER_CAB',
        'COD_ORDEM_SERVICO_CAB = ' + DMOrdemServico.QOrdemServicoCOD_ORDEM_SERVICO_CAB.Text));
    end;

    Executador.Adiciona(MontaUpdate('DT_SAIDA', 'NULL', 'TB_ORDEM_SERVICO_CAB',
      'COD_ORDEM_SERVICO_CAB = ' + DMOrdemServico.QOrdemServicoCOD_ORDEM_SERVICO_CAB.Text));
    wVal := '';
{Para definir a situação da O.S. como aberta quando voltar. Alex 06/01/2024.}
    Executador.Adiciona(MontaUpdate('IND_SITUACAO_OS', QuotedStr('ABERTA'), 'TB_ORDEM_SERVICO_CAB',
      'COD_ORDEM_SERVICO_CAB = ' + DMOrdemServico.QOrdemServicoCOD_ORDEM_SERVICO_CAB.Text));

    Executador.Adiciona(MontaDelete('TB_LANCAMENTO_CARTAO', 'COD_NOTA_CAB IN ( ' + MontaSelect('COD_NOTA_CAB ',
                        'TB_NOTA_CAB', 'COD_ORDEM_SERVICO_CAB = ' + DMOrdemServico.QOrdemServicoCOD_ORDEM_SERVICO_CAB.Text + ' ) ')));

    If not DMOrdemServico.QOrdemServicoCOD_NOTA_CAB.IsNull then
    Begin
      Executador.Adiciona(MontaDelete('TB_NOTA_ITEM', 'COD_NOTA_CAB = ' +
        DMOrdemServico.QOrdemServicoCOD_NOTA_CAB.Text));

      Executador.Adiciona(MontaDelete('TB_NOTA_CAB', 'COD_NOTA_CAB = ' +
        DMOrdemServico.QOrdemServicoCOD_NOTA_CAB.Text));
      DMPlanilha.descontabiliza(DMOrdemServico.QOrdemServicoNotaCOD_NOTA_CAB.Value,'NFS');;

    End;

    with DMOrdemServico do
    begin
      QOrdemServicoNota.Close;
      QOrdemServicoNota.SetVariable('ORDEM_SERVICO', QOrdemServicoCOD_ORDEM_SERVICO_CAB.Value);
      QOrdemServicoNota.Open;

      QOrdemServicoNota.First;
      while not QOrdemServicoNota.Eof do
      begin
        if QOrdemServicoNotaIND_SITUACAO.Value = '2' then
        begin
          If QOrdemServicoNotaIND_EMITE.Value = 'F' Then
           Begin
             DMPlanilha.Descontabiliza(QOrdemServicoNotaCOD_NOTA_CAB.Value,'NFS');
             wVal := Trim(wVal + #13 + #10 + 'Nota número ' + QOrdemServicoNotaNUM_NOTA.Text +
               ', da série ' + QOrdemServicoNotaCOD_SERIE.Value + ' está digitada.');
             Executador.Adiciona(MontaUpdate('IND_SITUACAO', '1', 'TB_NOTA_CAB',
               'COD_NOTA_CAB = ' + QOrdemServicoNotaCOD_NOTA_CAB.Text + ' AND IND_SITUACAO = 2'));
           End
          Else
           Begin
             Executador.Adiciona(MontaDelete('TB_NOTA_ITEM', 'COD_NOTA_CAB = ' +
               QOrdemServicoNotaCOD_NOTA_CAB.Text));

             Executador.Adiciona(MontaDelete('TB_NOTA_CAB', 'COD_NOTA_CAB = ' +
               QOrdemServicoNotaCOD_NOTA_CAB.Text));
           End;
           DMNfe.SetaNfe(Bib.LimpaNumero(QOrdemServicoNotaDESC_CHAVE_ACESSO.Value), True);
           if StrToInt('0' + DMNfe.QNfeSIT_NFE.Value) in SIT_NFE_ACEITO then
           begin
             Executador.Adiciona(MontaUpdate('IND_CONFIRMADO', QuotedStr('N'), 'TB_PAGAMENTO',
               'COD_NOTA_CAB = ' + QOrdemServicoNotaCOD_NOTA_CAB.Text));
           end
           else
           begin
             Executador.Adiciona(MontaDelete('TB_PAGAMENTO', 'COD_NOTA_CAB = ' +
                 QOrdemServicoNotaCOD_NOTA_CAB.Text));
           end;
        end;
        QOrdemServicoNota.Next;
      end;
    end;
    Executador.Executar(True);

    if wVal <> '' then
      MessageDlg(wVal + #13 + #10 + 'Exclua as notas acima que NÃO possuem validade fiscal.' +
        #13 + #10 + 'Cancele as que possuem.', mtWarning, [mbOK], 0);
    MessageDlg('Volta executada com sucesso.', mtConfirmation, [mbok], 0);
    DMOracle.DBCemapa.Commit;
    SBRefreshClick(Self);
    MMCadSimples.Items[2].Items[0].Enabled := true;
    MMCadSimples.Items[2].Items[1].Enabled := false;
  except
    if DMOrdemServico.QOrdemServico.State in [dsEdit, dsInsert] then
      DMOrdemServico.QOrdemServico.cancel;

    DMOracle.DBCemapa.Rollback;
    raise;
  end;
{  If DMOracle.BuscaNome('SELECT COD_LANCAMENTO_CARTAO FROM TB_LANCAMENTO_CARTAO','COD_NOTA_CAB ='+DMNotaSaida.QNotaSaidaCOD_NOTA_CAB.Text) <> '' then
  Begin
    try
      DMOracle.DBCemapa.StartTransaction;
      DMOracle.QExecSQL.Close;
      DMOracle.QExecSQL.SQL.Clear;
      DMOracle.QExecSQL.SQL.Add('DELETE TB_LANCAMENTO_CARTAO WHERE COD_NOTA_CAB = ' + chr(39) + DMNotaSaida.QNotaSaidaCOD_NOTA_CAB.Text + chr(39));
      DMOracle.QExecSQL.ExecSQL;
      DMOracle.DBCemapa.Commit;
    except
      DMOracle.DBCemapa.Rollback;
      raise Exception.Create('Não foi possível voltar o lançamento do cartão!');
    end;
  end;}
end;

procedure TFOrdemServicoCad.FecharOS1Click(Sender: TObject);
var
  wVal, wLibera, wDtVencto: string;
  wCusto: Real;
  wTipoItem, wEmite :String;
begin
  inherited;

  with DMOrdemServico do
  begin
    if QOrdemServicoDT_ENTRADA_MANUTENCAO.IsNull then
      QOrdemServicoDT_ENTRADA_MANUTENCAO.Text := DateToStr(Now);
    if QOrdemServicoDT_SAIDA_MANUTENCAO.IsNull then
      QOrdemServicoDT_SAIDA_MANUTENCAO.Text := DateToStr(Now);
    if (DMParamSistema.CodEmpresa = 'GEOPRO') or (DMParamSistema.CodEmpresa = 'CENTERFRIO') then
       QOrdemServicoIND_SITUACAO_OS.Value := 'FECHADA';
  end;
  if DMOrdemServico.QOrdemServico.RecordCount = 0 then
  begin
    MessageDlg('Nenhuma Ordem de Serviço selecionada', mtError, [mbOk],0);
    Abort;
  end;
  //Validar campos do cadastro para emissão de NFe. Junior 08/01/2021. Solicitado: Marcos(Cemapa)
  wEmite := DMOracle.FastSelect('IND_EMITE','TB_OPERACAO','COD_OPERACAO = ' + DMOrdemServico.QOrdemServicoCOD_OPERACAO.Text);
  if (wEmite = 'F') AND ((DMParamSistema.CodEmpresa = 'RETIFOZ') OR (DMParamSistema.CodEmpresa = 'RETIFOZ2')) then
  begin
    ValidaCamposNFeCadastro;
  end;

  if DMOrdemServico.QOrdemServicoDt_Saida.Value > 0 then
    raise Exception.Create('Ordem de Serviço já fechada');
  if FOrdemServicoFecha = nil then
    FOrdemServicoFecha := TFOrdemServicoFecha.Create(Application);
  FOrdemServicoFecha.MeObs.Text := '';

  wDtVencto := DMOracle.BuscaNome('SELECT MIN(DT_VENCIMENTO) FROM TB_CONTA_RECEBER_CAB', 'COD_CADASTRO = ' + FloatToStr(DMOrdemServico.QOrdemServicoCOD_CADASTRO.Value) + ' AND IND_SITUACAO <> ' + chr(39) + 'BAIXA TOTAL' + chr(39));
  if wDtvencto <> '' then
    if StrToDate(wDtVencto) < Date then
    begin
      wLibera := DMOracle.BuscaNome('SELECT IND_LIBERA_VENDA FROM TB_CADASTRO', 'COD_CADASTRO = ' +
        FloatToStr(DMOrdemServico.QOrdemServicoCOD_CADASTRO.Value));
      if wLibera = 'NAO' then
        raise Exception.Create('Cliente Com Titulos Atrasados! Consulte o Gerente!');
    end;
  //Calcula os totais de Servicos e Produtos
  with DMOrdemServico do
  begin
    pTotalServico := 0;
    pTotalPeca := 0;
    QOrdemServicoIt.First;
    while not QOrdemServicoIt.Eof do
    begin
      wTipoItem := DMOracle.FastSelect('IND_TIPO_PRODUTO','TB_PRODUTO','COD_PRODUTO = ' +
        QOrdemServicoItCOD_PRODUTO.Text);

      if wTipoItem = 'SERVIÇO' then
      begin
        if DMOracle.FastSelect('IND_ISS_RETIDO', 'TB_CADASTRO', 'COD_CADASTRO = ' + QOrdemServicoCOD_CADASTRO.Text) = '1' then
          pTotalServico := pTotalServico + (QOrdemServicoItvl_total.Value - QOrdemServicoItVAL_ISS.Value)
        else
          pTotalServico := pTotalServico + QOrdemServicoItvl_total.Value;
      end
      else
        pTotalPeca := pTotalPeca + QOrdemServicoItvl_total.Value;
      QOrdemServicoIt.Next;
    end;
  end;
  if FOrdemServicoFecha.ShowModal = MrOk then
  begin
    MMCadSimples.Items[2].Items[0].Enabled := false;
    MMCadSimples.Items[2].Items[1].Enabled := true;
  end;

  GeraBoletoApi; //Gera os boletos via api quando for o caso.

end;

procedure TFOrdemServicoCad.SBExcluirClick(Sender: TObject);
var
  wStr: String;
  wTrans: Boolean;
begin
  wTrans := DMOracle.DBCemapa.InTransaction;
  try
  with DMOrdemServico do
  begin
    if SBExcluir.Visible then
      if MessageDlg('Apagar este registro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        if QOrdemServico.IsEmpty then
          Exit;
        if QOrdemServicoDT_SAIDA.Value > 0 then
         raise Exception.Create('Esta ordem de serviço está fechada. Não pode ser excluída.');
{Criado este bloco para atualizar o cod_usuario que esta apagando os itens, sem este, na tb_log grava o usuário que abriu a o.s. Alex 30/09/2023 }
        DMOracle.DBCemapa.StartTransaction;
        DMOracle.QExecSQL.Close;
        DMOracle.QExecSQL.SQL.Clear;
        DMOracle.QExecSQL.SQL.Add('UPDATE TB_ORDEM_SERVICO_ITEM SET COD_USUARIO = ' + chr(39) + inttostr(DMUsuario.CodUsuarioCorrente) + chr(39));
        DMOracle.QExecSQL.SQL.Add('WHERE COD_ORDEM_SERVICO_CAB = ' + chr(39) + QOrdemServicoCOD_ORDEM_SERVICO_CAB.Text + chr(39));
        DMOracle.QExecSQL.ExecSQL;
        DMOracle.DBCemapa.Commit;
{Atualiza o cod_usuario que esta apagando a O.S., sem este, na tb_log grava o usuário que abriu a o.s. Alex 30/09/2023  }
        DMOracle.DBCemapa.StartTransaction;
        DMOracle.QExecSQL.Close;
        DMOracle.QExecSQL.SQL.Clear;
        DMOracle.QExecSQL.SQL.Add('UPDATE TB_ORDEM_SERVICO_CAB SET COD_USUARIO = ' + chr(39) + inttostr(DMUsuario.CodUsuarioCorrente) + chr(39));
        DMOracle.QExecSQL.SQL.Add('WHERE COD_ORDEM_SERVICO_CAB = ' + chr(39) + QOrdemServicoCOD_ORDEM_SERVICO_CAB.Text + chr(39));
        DMOracle.QExecSQL.ExecSQL;
        DMOracle.DBCemapa.Commit;
        SBRefreshClick(Sender);
{Fim das alterações. Adicionado o Refresh para corrigir o erro de usuário editando registro. Alex 10/02/2025.}
        QOrdemServicoNota.Close;
        QOrdemServicoNota.SetVariable('ORDEM_SERVICO', QOrdemServicoCOD_ORDEM_SERVICO_CAB.Value);
        QOrdemServicoNota.Open;

        wStr := '';
        QOrdemServicoNota.First;
        Executador.Limpa;
        while not QOrdemServicoNota.Eof do
        begin
          wStr := Trim(wStr + #13 + #10 + 'Nota número ' + QOrdemServicoNotaNUM_NOTA.Text +
              ', da série ' + QOrdemServicoNotaCOD_SERIE.Value + ' foi gerada desta OS.');
          Executador.Adiciona(MontaUpdate('COD_ORDEM_SERVICO_CAB', 'NULL', 'TB_NOTA_CAB',
              'COD_NOTA_CAB = ' + QOrdemServicoNotaCOD_NOTA_CAB.Text));
          QOrdemServicoNota.Next;
        end;
        if wStr <> '' then
        begin
          if (MessageDlg(wStr + #13 + #10 + 'Essas notas continuarão existindo no sistema de ' +
              'vendas mesmo que você exclua esta OS.' + #13 + #10 + 'Deseja remover a ' +
              'relação entre as notas acima e esta OS?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes) then
          Exit;
        Executador.Executar;
        end;
    //inherited; Esta linha chamava a exclusão e grava na tb_audit.
      // aqui vai excluir os itens da ordem de servico
        pExclui_Pelo_Botao := True; // somente para não executar um teste no before post da query - César 23/03/2015
        QOrdemServicoIt.First;
        While Not (QOrdemServicoIt.Eof) do
        begin
          ControleEstoqueOS(Sender);
          QOrdemServicoIt.Delete;
        end;
        pExclui_Pelo_Botao := False;
{Para excluir o checklist da ordem de serviço. Alex 30/09/2023}
        QOrdemServicoCheckList.First;
        While Not (QOrdemServicoCheckList.Eof) do
          QOrdemServicoCheckList.Delete;

        if DMOrdemServico.QOrdemServicoIt.RecordCount = 0 then //valida se foi apagado os itens
        begin
{Removendo Registro Filho "TB_FICHA_INSPECAO_VEICULAR" antes de deletar  "TB_ORDEM_SERVICO_CAB" Jefferson 21/10/2024 }
          DMOracle.QExecSQL.Close;
          DMOracle.QExecSQL.SQL.Clear;
          DMOracle.QExecSQL.SQL.Add('DELETE FROM TB_FICHA_INSPECAO_VEICULAR ');
          DMOracle.QExecSQL.SQL.Add('WHERE COD_ORDEM_SERVICO_CAB = ' + chr(39) + QOrdemServicoCOD_ORDEM_SERVICO_CAB.Text + chr(39));
          DMOracle.QExecSQL.ExecSQL;

          DMOracle.QExecSQL.Close;
          DMOracle.QExecSQL.SQL.Clear;
          DMOracle.QExecSQL.SQL.Add('DELETE FROM TB_ORDEM_SERVICO_CAB ');
          DMOracle.QExecSQL.SQL.Add('WHERE COD_ORDEM_SERVICO_CAB = ' + chr(39) + QOrdemServicoCOD_ORDEM_SERVICO_CAB.Text + chr(39));
          DMOracle.QExecSQL.ExecSQL;
          DMOracle.DBCemapa.Commit;
        end
        else
          DMOracle.DBCemapa.Rollback;
        end;
        SBRefreshClick(Sender);
{Bloco antigo.
        if DMOrdemServico.QOrdemServico.RecordCount = 0 then //Foi apagada a OS
          DMOracle.DBCemapa.Commit
        else
          DMOracle.DBCemapa.Rollback;
        end;}
        if DMParamSistema.CodEmpresa = 'NIR' then
        begin
          EdNomeFantasia.Clear;
          METelefone.Clear;
          MECelular.Clear;
        end;
        if (DMParamSistema.CodEmpresa = 'RETIFOZ') or (DMParamSistema.CodEmpresa = 'RRPECAS') or (DMParamSistema.CodEmpresa = 'RSMECANICA') or
           (DMParamSistema.CodEmpresa = 'RENATOAUTO') then
        begin
          MEDescPecas.Clear;
          MEDescServicos.Clear;
          MEDescPecasPerc.Clear;
          MEDescServicosPerc.Clear;
        end;
        MEPlaca.Clear;
        EdModelo.Clear;
      end;
      except
      if wTrans = False then
        DMOracle.DBCemapa.Rollback;
      raise;
    end;
end;

procedure TFOrdemServicoCad.FormCreate(Sender: TObject);
begin
  inherited;
  DBPanel8.Visible := false;
  if (DMParamSistema.CodEmpresa <> 'NIR') then
  begin
    EdNomeFantasia.Enabled := false;
    LbNomeFantasia.Enabled := false;
    EdNomeFantasia.Visible := false;
    LbNomeFantasia.Visible := false;
  end;
  if (DMParamSistema.CodEmpresa = 'NIR') then
  begin
    TSCheckList.TabVisible:= true;
    TSCheckList.Enabled:= true;

    TsFichaInspecao.TabVisible := false;
    MEDescServicos.Visible := false;
    MEDescPecas.Visible := false;
    MEDescPecasPerc.Visible := false;
    MEDescServicosPerc.Visible := false;
    LBDescPercas.Visible := false;
    LBDescServicos.Visible := false;
    LBDescServicoPerc.Visible := false;
    LBDescPercasPerc.Visible := false;
    BtCopia.Enabled := false;
    BtCopia.Visible := false;
    EdNomeFantasia.Top := 51;
    LbNomeFantasia.Top := 35;
  end;

  if DMParamSistema.CodEmpresa = 'ENCOPEL' then
  begin
    Self.Caption := 'Requisição de Cópias';
    TabSheet2.Caption := 'Cópias';
    TSCab.Caption := 'Requisição';
    DBPTecnico.LCaption := 'Vendedor';
    label3.caption := 'Produto';
  end;
  if (DMParamSistema.CodEmpresa = 'MEDIPECAS') or (DMParamSistema.CodEmpresa = 'MEDFRIG') then
  begin
    DBPDescCadastro.Visible := True;
//    DBPCadastro.Width := DBPCadastro.Width - DBPDescCadastro.Width - 2;
  end;
  if DMParamSistema.CodEmpresa = 'RADIO' then
  begin
    label3.Caption := 'Produto';
    label5.Caption := 'Concerto';
  end;

  if (DMParamSistema.CodEmpresa = 'FURGOESMED') then
  begin
    DBPQteHoras.Visible := True;
    LbNumFabricante.Visible := True;
    EdNumFabricante.Visible := True;
    Label2.Visible := True;
    MEPlaca.Visible := True;
    SBVeiculo.Enabled := True;
    SBVeiculo.Visible := True;
    EdModelo.Visible := True;
  end;

  Bib.addControleCharCase(DBSenhaEquipamento, Self.Name);
  if Buscador = nil then
    Buscador := TBuscador.Create;

  if (DMParamSistema.CodEmpresa = 'RETIFOZ') or (DMParamSistema.CodEmpresa = 'RRPECAS') or (DMParamSistema.CodEmpresa = 'RSMECANICA') or
     (DMParamSistema.CodEmpresa = 'RENATOAUTO') then
  begin
    TsFichaInspecao.TabVisible := false;
    MEDescServicos.Visible := true;
    MEDescPecas.Visible := true;
    MEDescPecasPerc.Visible := true;
    MEDescServicosPerc.Visible := true;
    LBDescPercas.Visible := true;
    LBDescServicos.Visible := true;
    LBDescServicoPerc.Visible := true;
    LBDescPercasPerc.Visible := true;
    TSCheckList.TabVisible:= false;
    TSCheckListGeo.TabVisible := false;
    DBPanel5.Visible := false;
  end
  else
  begin
   if DMParamSistema.CodEmpresa <> 'NIR' then
   begin
     TsFichaInspecao.TabVisible := false;
     MEDescServicos.Visible := false;
     MEDescPecas.Visible := false;
     MEDescPecasPerc.Visible := false;
     MEDescServicosPerc.Visible := false;
     LBDescPercas.Visible := false;
     LBDescServicos.Visible := false;
     LBDescServicoPerc.Visible := false;
     LBDescPercasPerc.Visible := false;
     TSCheckList.TabVisible:= false;
   end;
  if (DMParamSistema.CodEmpresa <> 'GEOPRO') then
    TSCheckListGeo.TabVisible := false;
  end;
  if DMParamSistema.CodEmpresa = 'GEOPRO' then
  begin
    TSCheckListGeo.PageIndex := 2;
    Label3.Caption    := 'Imóvel';
    TabSheet2.Caption := 'Serviço';
    TSCheckListGeo.Caption := 'Doc. Pendentes';
    DBMObs_Cab.Visible := True;
    DBMObs_Cab.Top := 465;
    DBMObs_Cab.Height := 100;
    DBMemo1.Height := 190;
    DBMemo2.Height := 190;
    Label5.Caption := 'Informações para etiqueta';
  end;

  if (DMParamSistema.CodEmpresa = 'RRPECAS') or (DMParamSistema.CodEmpresa = 'RSMECANICA') then
  begin
    DBMObs_Cab.Visible := True;
    DBMObs_Cab.Top := 488;
  end;

  if (DMParamSistema.CodEmpresa <> 'MEDIPECAS')  and (DMParamSistema.CodEmpresa <> 'MEDSYSTEM') and (DMParamSistema.CodEmpresa <> 'FURGOESMED') and
     (DMParamSistema.CodEmpresa <> 'BENINI') 	   and (DMParamSistema.CodEmpresa <> 'REDIESEL')  and (DMParamSistema.CodEmpresa <> 'DATEL') 	    and
     (DMParamSistema.CodEmpresa <> 'PATELI') 	   and (DMParamSistema.CodEmpresa <> 'ZIEL') 	    and (DMParamSistema.CodEmpresa <> 'JOFER')  	  and
     (DMParamSistema.CodEmpresa <> 'RRPECAS') 	 and (DMParamSistema.CodEmpresa <> 'COMIN')     and (DMParamSistema.CodEmpresa <> 'NFCE-IVO')   and
     (DMParamSistema.CodEmpresa <> 'RSMECANICA') and (DMParamSistema.CodEmpresa <> 'ZANONI')    and (DMParamSistema.CodEmpresa <> 'ALFA')       and
     (DMParamSistema.CodEmpresa <> 'RENATOAUTO') then
  begin
    MEPlaca.Visible := false;
    Label2.Visible := false;
    SBVeiculo.Visible := false;
    SBVeiculo.Enabled := false;
    EdModelo.Visible := false;
  end;

  if (DMParamSistema.CodEmpresa = 'ZIEL') then
    Label3.Caption := 'Moto';

  if (DMParamSistema.CodEmpresa = 'NFCE-IVO') then
  begin
    Label3.Caption := 'Carro';
    DBPTecnico.LCaption := 'Mecânico';
    DBPTecnico.Enabled := True;
    DBPanelVendedor.Enabled := true;
    DBPanelVendedor.Visible := True;
  end;

  if (DMParamSistema.CodEmpresa = 'RENATOAUTO') then
    EdNumFabricante.Visible := True;

  AtivaDesativaAPI;

end;

procedure TFOrdemServicoCad.SBFechaOSClick(Sender: TObject);
begin
  inherited;
  FecharOS1Click(sender);
end;

procedure TFOrdemServicoCad.SBAlterarClick(Sender: TObject);
var
  wMensagem: string;
begin
  inherited;
  ControleEstoqueOS(Sender);
  //ATUALIZAÇÃO PARA MEDIPEÇAS
  if DMParamSistema.CodEmpresa = 'MEDIPECAS' then
    if DMOrdemServico.QOrdemServico.RecordCount > 0 then
      DSItens.DataSet.Insert;

  if (DMParamSistema.CodEmpresa = 'RETIFOZ') then
  begin
    MEDescPecasPerc.Enabled := true;
    MEDescServicosPerc.Enabled := true;
    if not (DSFichaCons.DataSet.IsEmpty) then
    begin
      DSFichaCons.DataSet.Edit;
    end;
  end;

  if (DMParamSistema.CodEmpresa = 'RRPECAS') or (DMParamSistema.CodEmpresa = 'RSMECANICA') or (DMParamSistema.CodEmpresa = 'RENATOAUTO') then
  begin
    MEDescPecasPerc.Enabled := True;
    MEDescServicosPerc.Enabled := True;
  end;
{Para trazer a mensagem que esta na operação. Alex 29/04/2026}  
  with DMOrdemServico do
  begin
    if (QOrdemServicoCOD_OPERACAO.Text <> '') then
    begin
      wMensagem := DMOracle.FastSelect('COD_MENSAGEM','TB_OPERACAO','COD_OPERACAO = ' + QOrdemServicoCOD_OPERACAO.Text);
      DBPanel19.DBEdit.Text := wMensagem;
    end;
  end;

end;

procedure TFOrdemServicoCad.SBCancelarClick(Sender: TObject);
var wDataSetState: integer;
 wEstoqueNegativo: string;
begin
  wDataSetState := 0;
  if DMOrdemServico.QOrdemServico.State = dsEdit then
    wDataSetState := 1;
  if DSCheckList.DataSet.State in [dsInsert,dsEdit] then
    DSCheckList.DataSet.Cancel;

  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'MEDIPECAS' then
    if DMOrdemServico.QOrdemServicoItCOD_PRODUTO.Text = '' then
      DSItens.DataSet.Cancel;
  //Quando clicar em cancelar, mostrar o veículo correto da Ordem de Serviço.
  with DMOrdemServico do
  if (QOrdemServico.RecordCount > 0) and (QOrdemServicoCOD_VEICULO.Value > 0) then
  begin
    MePlaca.Text := DMOracle.FastSelect('NUM_PLACA','TB_VEICULO','COD_VEICULO = ' + QOrdemServicoCOD_VEICULO.Text);
    MePlacaExit(Sender);
  end;
  if (DMParamSistema.CodEmpresa = 'RETIFOZ') or (DMParamSistema.CodEmpresa = 'RRPECAS') or (DMParamSistema.CodEmpresa = 'RSMECANICA') or
     (DMParamSistema.CodEmpresa = 'RENATOAUTO') then
  begin
    MEDescPecasPerc.Enabled := false;
    MEDescServicosPerc.Enabled := false;
    MEDescPecas.Enabled := false;
    MEDescServicos.Enabled := false;
    LeDescontoRetifoz;
  end;
  inherited;
  TSpeedButton(Sender).Tag := wDataSetState;
  if not BibAssistencia.VerificaEstoqueNegativo(wEstoqueNegativo) then
      ControleEstoqueOS(Sender)
  else
  begin
    MessageDlg('Produtos com estoque negativo!!', mtError, [mbOk], 0);
    DMOrdemServico.QOrdemServico.Edit;
    DSItens.DataSet.Edit;
    Raise Exception.Create('Verifique os produtos antes de continuar: ' + wEstoqueNegativo);
  end;
  if (DMParamSistema.CodEmpresa = 'NIR') then
  begin
    METelefone.Clear;
    MECelular.Clear;
  end;
end;

function TFOrdemServicoCad.MedipecasRenderizar(Sender: TObject): Boolean;
begin
  Result := (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'MEDIPECAS');
end;

procedure TFOrdemServicoCad.DBPLoteDefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FTipoLoteCons;
  Classe := TFTipoLoteCons;
end;

procedure TFOrdemServicoCad.DBPTributacaoDefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FTributacaoCons;
  Classe := TFTributacaoCons;
end;

procedure TFOrdemServicoCad.DBPCadastroCodigoExit(Sender: TObject);
var
  wDtVencto, wLibera, wIndVenda: string;
begin
  inherited;
  if (DSPrimario.State in [DsEdit, DsInsert]) And
     (DMOrdemServico.QOrdemServicoCOD_CADASTRO.Text <> '') then
  begin
    Buscador.Limpa;
    Buscador.Adiciona('MIN(DT_VENCIMENTO)', 'TB_CONTA_RECEBER_CAB',
      'COD_CADASTRO = 0' + DMOrdemServico.QOrdemServicoCOD_CADASTRO.Text +
      ' AND IND_SITUACAO <> ' + QuotedStr('BAIXA TOTAL'));
    Buscador.Adiciona('IND_LIBERA_VENDA', 'TB_CADASTRO',
      'COD_CADASTRO = 0' + DMOrdemServico.QOrdemServicoCOD_CADASTRO.Text);
    Buscador.Buscar(True);
    wDtVencto := Buscador.Proximo;
    wLibera := Buscador.Proximo;
    if (wDtvencto <> '') and (StrToDate(wDtVencto) < Date) and (wLibera = 'NAO') then
      ShowMessage('Cliente Com Titulos Atrasados!');

    //Gian 23/01/2018, Solicitado por Junior, informa o cliente caso classifcação do cadastro não possa fazer venda

    wIndVenda := DMOracle.BuscaNome('SELECT IND_VENDA FROM TB_CLASS_CADASTRO CL, TB_CADASTRO CD','CD.COD_CLASS_CADASTRO = CL.COD_CLASS_CADASTRO AND COD_CADASTRO = '+ DMOrdemServico.QOrdemServicoCOD_CADASTRO.Text);
    if wIndVenda = 'N' then
      ShowMessage('Cadastro possui classificação não permitida para vendas, por favor verifique...');
    if (DMParamSistema.CodEmpresa = 'NIR') then
    begin
      if (DMOrdemServico.QOrdemServicoCOD_CADASTRO.Text <> '') then
      begin
        EdNomeFantasia.Text := DMOracle.FastSelect('DESC_FANTASIA','TB_CADASTRO','COD_CADASTRO = ' + DMOrdemServico.QOrdemServicoCOD_CADASTRO.Text);
        METelefone.EditText := DMOracle.FastSelect('DESC_TELEFONE','TB_CADASTRO','COD_CADASTRO = ' + DMOrdemServico.QOrdemServicoCOD_CADASTRO.Text);
        MECelular.EditText := DMOracle.FastSelect('DESC_CELULAR','TB_CADASTRO','COD_CADASTRO = ' + DMOrdemServico.QOrdemServicoCOD_CADASTRO.Text);
      end;
    end;
  end;
end;

procedure TFOrdemServicoCad.DBPTecnicoDefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FVendedorCons;
  Classe := TFVendedorCons;
end;

procedure TFOrdemServicoCad.DBPanel10DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FOperacaoCons;
  Classe := TFOperacaoCons;
end;

procedure TFOrdemServicoCad.DBPanel8DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FVeiculoCons;
  Classe := TFVeiculoCons;
end;

procedure TFOrdemServicoCad.DBPFilialDefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FFilialCons;
  Classe := TFFilialCons;
end;

procedure TFOrdemServicoCad.DBPCadastroDefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FCadastroCons;
  Classe := TFCadastroCons;
end;

procedure TFOrdemServicoCad.DBPCadastroAfterConsulta(Sender: TObject);
begin
  inherited;
  DBPCadastroCodigoExit(Self);
end;

procedure TFOrdemServicoCad.DBPProdutoCodigoExit(Sender: TObject);
var wPerc_desconto, wValAtacado, wValVarejo : string;
    wCodigo, wRecNo : Integer;
begin
  inherited;
  if DMOrdemServico.QOrdemServico.State in [dsInsert,dsEdit] then
    wPerc_desconto := '0'+ DMOracle.FastSelect('PERC_DESCONTO2','TB_CADASTRO','COD_CADASTRO = ' + DMOrdemServico.QOrdemServicoCOD_CADASTRO.Text);
  with DMOrdemServico do
    if QOrdemServicoIt.State in [dsInsert, dsEdit] then
      if QOrdemServicoItCOD_PRODUTO.Text <> '' then
      begin
        // Na nota ao consumidor, estava "acess violation" quando inseria novos itens em notas já digitadas, para evitar foi necessario fechar e abrir a query. Junior - 18/03/2014
        DMCadastro.QCadastro.Close;
        DMCadastro.QCadastro.SetVariable('PK',DMOrdemServico.QOrdemServicoCOD_CADASTRO.Value);
        DMCadastro.QCadastro.Open;
        DMCadastro.QCadastro.RefreshRecord;
        //Buscar Vlr Atcado/Varejo conforme o cadastro do cliente. Programado igual faz na nota de Saida - Junior 08/09/2017
        if (DMParamSistema.CodEmpresa = 'TRENTO') then
        Begin
        {
          QOrdemServicoItVL_UNITARIO.Value := DMProduto.PrecoVenda(QOrdemServicoItCOD_PRODUTO.Value,
            QOrdemServicoCOD_CADASTRO.Text, Bib.ift(
            DMCadastro.QCadastroIND_ATACADO_VAREJO.Value = 'V', 'F', 'J'));
          QOrdemServicoItCOD_LOTE_TIPO.Value := 1;

          Comentado por Gian 16/04/2018
          A partir de agora, o Aurélio quer que a diferença dos
          valores de varejo e atacado apareçam como desconto,
          caso o desconto seja de atacado
        }
          if DMCadastro.QCadastroIND_ATACADO_VAREJO.Value = 'A' then
          begin
            wValAtacado := DMOracle.FastSelect('NVL(VAL_ATACADO, 0)','TB_PRODUTO','COD_PRODUTO = ' + QOrdemServicoItCOD_PRODUTO.Text);
            wValVarejo := DMOracle.FastSelect('NVL(VAL_VAREJO, 0)','TB_PRODUTO','COD_PRODUTO = ' + QOrdemServicoItCOD_PRODUTO.Text);

            if (StrToFloat(wValAtacado) > 0) and (StrToFloat(wValVarejo) > 0) then
            begin
              QOrdemServicoItVL_UNITARIO.Value := StrToFloat(wValVarejo);
              QOrdemServicoItVAL_DESCONTO.Value := StrToFloat(wValVarejo) - StrToFloat(wValAtacado);
            end;
          end
          else
          begin
            QOrdemServicoItVL_UNITARIO.Value := DMProduto.PrecoVenda(QOrdemServicoItCOD_PRODUTO.Value,
              QOrdemServicoCOD_CADASTRO.Text, Bib.ift(
              DMCadastro.QCadastroIND_ATACADO_VAREJO.Value = 'V', 'F', 'J'));
          end;
          QOrdemServicoItCOD_LOTE_TIPO.Value := 1;
        end
        else
        begin
          DMOrdemServico.PrecoTabela;

          //QOrdemServicoItVL_UNITARIO.Value := DMProduto.PrecoVenda(QOrdemServicoItCOD_PRODUTO.Value, QOrdemServicoCOD_CADASTRO.Text,'F',QOrdemServicoItCOD_LOTE_TIPO.Value);
        end;
        {QOrdemServicoItVL_UNITARIO.Text := DMOracle.FastSelect('VAL_VAREJO',
            'TB_PRODUTO', 'COD_PRODUTO = ' + QOrdemServicoItCOD_PRODUTO.Text);} //Mudado para pegar o valor Atacado/Varejo conforme o cadastro do cliente 08/09/2017 - Junior

        ind_tipo_produto := DMOracle.FastSelect('IND_TIPO_PRODUTO',
            'TB_PRODUTO', 'COD_PRODUTO = ' + QOrdemServicoItCOD_PRODUTO.Text);
        //Trazer o desconto informado no cadastro do cliente. Solicitação Marcos. Junior 27/02/2015.
        QOrdemServicoItPERC_DESCONTO.Value := StrToFloat(wPerc_desconto);
        if (DMParamSistema.CodEmpresa <> 'FURGOESMED') and (DMParamSistema.CodEmpresa <> 'MEDSYSTEM') and
           (DMParamSistema.CodEmpresa <> 'REGINATO')   and (DMParamSistema.CodEmpresa <> 'JOFER')     and
           (DMParamSistema.CodEmpresa <> 'RRPECAS') and (DMParamSistema.CodEmpresa <> 'RSMECANICA') then
        begin
          // esta rotina serve para verificar se o produto que esta sendo inserido na Ordem de Serviço já foi incluido - César 03/08/2016
          wCodigo := QOrdemServicoItCOD_ORDEM_SERVICO_ITEM.Value;
          wRecNo := QOrdemServicoIt.RecNo;
          If QOrdemServicoIt.Locate('COD_PRODUTO',QOrdemServicoItCOD_PRODUTO.Text,[]) Then
             If wCodigo <> QOrdemServicoItCOD_ORDEM_SERVICO_ITEM.Value Then
             Begin
               QOrdemServicoIt.RecNo := wRecNo;
                Raise exception.create('Produto já incluido na ordem de serviço');
             End;
        end;
        DBPanel20Exit(Sender);
      end;
end;

procedure TFOrdemServicoCad.DBPProdutoDefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FProdutoCons;
  Classe := TFProdutoCons;
end;

procedure TFOrdemServicoCad.DBPProdutoAfterConsulta(Sender: TObject);
begin
  inherited;
  if DMParamSistema.CodEmpresa = 'REGINATO' then
  begin
    ValidaQuantidadeMinima;
  end;
  DBPProdutoCodigoExit(Sender);
end;

procedure TFOrdemServicoCad.BtConfirmarClick(Sender: TObject);
begin
  inherited;
  if DMParamSistema.CodEmpresa = 'REGINATO' then
  begin
    ValidaQuantidadeMinima;
  end;
  if ValidaCampos(Self, DSItens) then
    DSItens.DataSet.Post;
end;

procedure TFOrdemServicoCad.BtIncluirClick(Sender: TObject);
begin
  inherited;
  DSItens.DataSet.Append;
  if (DMParamSistema.CodEmpresa = 'FURGOESMED') or (DMParamSistema.CodEmpresa = 'RENATOAUTO') then
    EdNumFabricante.SetFocus;
end;

procedure TFOrdemServicoCad.BtEditarClick(Sender: TObject);
begin
  inherited;
  DSItens.DataSet.Edit;
end;

procedure TFOrdemServicoCad.BtExcluirClick(Sender: TObject);
begin
{Criado este bloco para atualizar o cod_usuario que esta apagando os itens, sem este, na tb_log grava o usuário que abriu a o.s. Alex 30/09/2023}
  DMOracle.DBCemapa.StartTransaction;
  DMOracle.QExecSQL.Close;
  DMOracle.QExecSQL.SQL.Clear;
  DMOracle.QExecSQL.SQL.Add('UPDATE TB_ORDEM_SERVICO_ITEM SET COD_USUARIO = ' + chr(39) + inttostr(DMUsuario.CodUsuarioCorrente) + chr(39));
  DMOracle.QExecSQL.SQL.Add('WHERE COD_ORDEM_SERVICO_CAB = ' + chr(39) + DMOrdemServico.QOrdemServicoItCOD_ORDEM_SERVICO_CAB.Text + chr(39));
  DMOracle.QExecSQL.ExecSQL;
  DMOracle.DBCemapa.Commit;
{fim}
  inherited;
  DSItens.DataSet.Delete;
end;

procedure TFOrdemServicoCad.BtCancelarClick(Sender: TObject);
begin
  inherited;
  DSItens.DataSet.Cancel;
end;

procedure TFOrdemServicoCad.DSItensStateChange(Sender: TObject);
var
  b, b2: boolean;
begin
  inherited;
  b := DSPrimario.State in [dsEdit, dsInsert];
  b2 := DSItens.State in [dsEdit, dsInsert];
  BtIncluir.Enabled := b and not b2;
  BtEditar.Enabled := b and not b2;
  BtExcluir.Enabled := b and not b2;
  BtConfirmar.Enabled := b2;
  BtCancelar.Enabled := b2;
end;

procedure TFOrdemServicoCad.Cortesia1Click(Sender: TObject);
begin
  inherited;
  if DMOrdemServico.QOrdemServicoDt_Saida.Value > 0 then
    raise Exception.Create('Ordem de Serviço já fechada');
  try
  if (DMParamSistema.CodEmpresa = 'CENTERFRIO') then
  begin
     DMOrdemServico.QOrdemServico.Edit;
     DMOrdemServico.QOrdemServicoDT_SAIDA.Value := Date;
     DMOrdemServico.QOrdemServicoIND_SITUACAO_OS.Value := 'GARANTIA';
     DMOrdemServico.QOrdemServico.Post;
     DMOracle.DBCemapa.Commit;
  end
  else
  begin
     DMOrdemServico.QOrdemServico.Edit;
     DMOrdemServico.QOrdemServicoDT_SAIDA.Value := Date;
     DMOrdemServico.QOrdemServicoIND_SITUACAO_OS.Value := 'CORTESIA';
     DMOrdemServico.QOrdemServico.Post;
     DMOracle.DBCemapa.Commit;
  end;
   except
     if DMOrdemServico.QOrdemServico.State in [dsEdit, dsInsert] then
       DMOrdemServico.QOrdemServico.Cancel; // RollBack
    // ModalResult := mrCancel;
     raise;
{  end;
     DMOrdemServico.QOrdemServico.Edit;
     DMOrdemServico.QOrdemServicoDT_SAIDA.Value := Date;
     DMOrdemServico.QOrdemServico.Post;
     DMOracle.DBCemapa.Commit;
   except
     if DMOrdemServico.QOrdemServico.State in [dsEdit, dsInsert] then
       DMOrdemServico.QOrdemServico.Cancel; // RollBack
    // ModalResult := mrCancel;
     raise;}
  end;


end;
                                                                                                 
procedure TFOrdemServicoCad.EnviarSMS1Click(Sender: TObject);
var
  mensagem: String;
  cod_cadastro: integer;
begin
  inherited;
  if messageDlg('Deseja realmente enviar o SMS?', mtConfirmation, [mbyes, mbno], 0) <> mryes then
    Abort;
  if trim(DMOrdemServico.QOrdemServicoCOD_CADASTRO.AsString) = '' then
    raise Exception.Create('Selecione uma ordem de serviço');
  if DMParamSistema.QParamSistemaCOD_MENSAGEM_SMS_OS.AsString = '' then
    raise Exception.Create('Mensagem não informada');
  mensagem := dmoracle.FastSelect('DESC_MENSAGEM || DESC_COMPLEMENTO','TB_MENSAGEM',
    'COD_MENSAGEM = ' + DMParamSistema.QParamSistemaCOD_MENSAGEM_SMS_OS.AsString);
  if(trim(mensagem) = '') then
    raise Exception.Create('Mensagem em branco');
  MessageDlg(bib.EnviaSMSApiWeb(DMOrdemServico.QOrdemServicoCOD_CADASTRO.Value, mensagem), mtInformation, [mbOK], 0);;
end;

procedure TFOrdemServicoCad.EdCodBarrasExit(Sender: TObject);
var
  wCodProduto, wCodItem, wAuxValorUn, wValAtacado, wValVarejo: String;
  wAchou: Boolean;
  wValorUn: Real;
begin
  inherited;
  if trim(EdCodBarras.Text) <> '' then
  begin
    wCodProduto := DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTO', 'DESC_COD_BARRA = ' + QuotedStr(trim(EdCodBarras.Text)));
    EdCodBarras.Clear;
    if wCodProduto = '' then
    begin
      EdCodBarras.SetFocus;
      raise Exception.Create('O código de barra informado não corresponde a nenhum produto cadastrado.');
    end;
    with DMOrdemServico do
    begin
      if QOrdemServicoIt.State in [DsEdit, DsInsert] then
        raise Exception.Create('Confirme o item anterior para adicionar um pelo código de barras');
      if QOrdemServicoIt.RecordCount > 0 then
      begin
        QOrdemServicoIt.First;
        wAchou := false;
        while (not QOrdemServicoIt.Eof) and (not wAchou) do
        begin
          if QOrdemServicoItCOD_PRODUTO.Value = StrToInt(wCodProduto) then
          begin
            QOrdemServicoIt.Edit;
            QOrdemServicoItQT_PRODUTO.Value := QOrdemServicoItQT_PRODUTO.Value + 1;
            QOrdemServicoIt.Post;
            wAchou := true;
          end
          else
            QOrdemServicoIt.Next;
        end;
        if not wAchou then
        begin
          QOrdemServicoIt.Append;
          QOrdemServicoItCOD_PRODUTO.Value := StrToInt(wCodProduto);
          QOrdemServicoItCOD_LOTE_TIPO.Value := 1;
          wValorUn := StrToFloat(dmoracle.FastSelect('NVL(VAL_VAREJO, 0)','TB_PRODUTO', 'COD_PRODUTO = '
            + wCodProduto));
          //Para Trento, deve considerar configuracao no cadastro para buscar o preco
          if (DMParamSistema.CodEmpresa = 'TRENTO') then
          Begin
          {
            QOrdemServicoItVL_UNITARIO.Value := DMProduto.PrecoVenda(QOrdemServicoItCOD_PRODUTO.Value,
              QOrdemServicoCOD_CADASTRO.Text, Bib.ift(
              DMCadastro.QCadastroIND_ATACADO_VAREJO.Value = 'V', 'F', 'J'));
            QOrdemServicoItCOD_LOTE_TIPO.Value := 1;

            Comentado por Gian 16/04/2018
            A partir de agora, o Aurélio quer que a diferença dos
            valores de varejo e atacado apareçam como desconto,
            caso o desconto seja de atacado
          }
            if DMOracle.FastSelect('IND_ATACADO_VAREJO','TB_CADASTRO','COD_CADASTRO = ' + QOrdemServicoCOD_CADASTRO.Text) = 'A' then
            begin
              wValAtacado := DMOracle.FastSelect('NVL(VAL_ATACADO, 0)','TB_PRODUTO','COD_PRODUTO = ' + QOrdemServicoItCOD_PRODUTO.Text);
              wValVarejo := DMOracle.FastSelect('NVL(VAL_VAREJO, 0)','TB_PRODUTO','COD_PRODUTO = ' + QOrdemServicoItCOD_PRODUTO.Text);

              if (StrToFloat(wValAtacado) > 0) and (StrToFloat(wValVarejo) > 0) then
              begin
                QOrdemServicoItVL_UNITARIO.Value := StrToFloat(wValVarejo);
                QOrdemServicoItVAL_DESCONTO.Value := StrToFloat(wValVarejo) - StrToFloat(wValAtacado);
              end;
            end
            else
            begin
              QOrdemServicoItVL_UNITARIO.Value := DMProduto.PrecoVenda(QOrdemServicoItCOD_PRODUTO.Value,
                QOrdemServicoCOD_CADASTRO.Text, Bib.ift(
                DMCadastro.QCadastroIND_ATACADO_VAREJO.Value = 'V', 'F', 'J'));
            end;
            QOrdemServicoItCOD_LOTE_TIPO.Value := 1;
          end;
          while wValorUn <= 0 do
          begin
            wAuxValorUn := floattostr(wValorUn);
            if InputQuery('Informe o valor solicitado.',
              'O valor do produto no cadastro está invalido, informe um valor maior que zero', wAuxValorUn) then
            begin
              try
                wValorUn := StrToFloat(wAuxValorUn);
              Except
                MessageDlg('Valor informado em formato invalido, verifique!', mtError, [mbOK], 0);
              end;
            end
            else
            begin
              QOrdemServicoIt.Cancel;
              EdCodBarras.SetFocus;
              Abort;
            end;
          end;
          QOrdemServicoItVL_UNITARIO.Value := wValorUn;
          //QOrdemServicoItVAL_DESCONTO.Value := 0.00;
          QOrdemServicoIt.Post;
        end;
      end
      else
      begin
        QOrdemServicoIt.Insert;
        QOrdemServicoItCOD_PRODUTO.Value := StrToInt(wCodProduto);
        QOrdemServicoItCOD_LOTE_TIPO.Value := 1;
        wValorUn := StrToFloat(dmoracle.FastSelect('NVL(VAL_VAREJO, 0)','TB_PRODUTO', 'COD_PRODUTO = '
        + wCodProduto));
        if (DMParamSistema.CodEmpresa = 'TRENTO') then
        Begin
        {
          QOrdemServicoItVL_UNITARIO.Value := DMProduto.PrecoVenda(QOrdemServicoItCOD_PRODUTO.Value,
            QOrdemServicoCOD_CADASTRO.Text, Bib.ift(
            DMCadastro.QCadastroIND_ATACADO_VAREJO.Value = 'V', 'F', 'J'));
          QOrdemServicoItCOD_LOTE_TIPO.Value := 1;

          Comentado por Gian 16/04/2018
          A partir de agora, o Aurélio quer que a diferença dos
          valores de varejo e atacado apareçam como desconto,
          caso o desconto seja de atacado
        }
          if DMOracle.FastSelect('IND_ATACADO_VAREJO','TB_CADASTRO','COD_CADASTRO = ' + QOrdemServicoCOD_CADASTRO.Text) = 'A' then
          begin
            wValAtacado := DMOracle.FastSelect('NVL(VAL_ATACADO, 0)','TB_PRODUTO','COD_PRODUTO = ' + QOrdemServicoItCOD_PRODUTO.Text);
            wValVarejo := DMOracle.FastSelect('NVL(VAL_VAREJO, 0)','TB_PRODUTO','COD_PRODUTO = ' + QOrdemServicoItCOD_PRODUTO.Text);

            if (StrToFloat(wValAtacado) > 0) and (StrToFloat(wValVarejo) > 0) then
            begin
              QOrdemServicoItVL_UNITARIO.Value := StrToFloat(wValVarejo);
              QOrdemServicoItVAL_DESCONTO.Value := StrToFloat(wValVarejo) - StrToFloat(wValAtacado);
            end;
          end;
        end;
        while wValorUn <= 0 do
        begin
          wAuxValorUn := floattostr(wValorUn);
          if InputQuery('Informe o valor solicitado.',
            'O valor do produto no cadastro está invalido, informe um valor maior que zero', wAuxValorUn) then
          begin
            try
              wValorUn := StrToFloat(wAuxValorUn);
            Except
              MessageDlg('Valor informado em formato invalido, verifique!', mtError, [mbOK], 0);
            end;
          end
          else
          begin
            QOrdemServicoIt.Cancel;
            EdCodBarras.SetFocus;
            Abort;
          end;
        end;
        QOrdemServicoItVL_UNITARIO.Value := wValorUn;
        //QOrdemServicoItVAL_DESCONTO.Value := 0.00;
        QOrdemServicoIt.Post;
      end;
    end;
    EdCodBarras.SetFocus;
  end;
end;

procedure TFOrdemServicoCad.DBPanel14Exit(Sender: TObject);
var
  wValorAtual : Double;
begin
  inherited;
  {
    Gian 10/11/2017
    Trecho comentado a pedido do junior, aparentemente ninguem na Benini esta precisando dessa senha pois quem faz OS é somente a Cecília
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'BENINI' then
  Begin
    If DMOrdemServico.QOrdemServicoItVL_UNITARIO.Value <>
    StrToFloat(DMOracle.BuscaNome('SELECT VAL_VAREJO FROM TB_PRODUTO','COD_PRODUTO='+DMOrdemServico.QOrdemServicoItCOD_PRODUTO.Text))then
    begin
      if FSenha = nil then
        FSenha := TFSenha.Create(Application);
      FSenha.BitBtn2.Visible := False;
      if FSenha.ShowModal = MrOk then
        if UpperCase(Trim(FSenha.EdSenha.Text)) <> UpperCase(DmParamSistema.QParamSistemaDesc_Senha_Oficina.Value) then
        Begin
          DBPanel14.SetFocus;
          DMOrdemServico.QOrdemServicoItVL_UNITARIO.Value := StrToFloat(DMOracle.BuscaNome('SELECT VAL_VAREJO FROM'+
                                           ' TB_PRODUTO','COD_PRODUTO='+DMOrdemServico.QOrdemServicoItCOD_PRODUTO.Text));
          raise Exception.Create('Usuário sem permissão para Alterar preços!');
        end;
    end;
  end;}
  if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'TRENTO')
    and (DSPrimario.DataSet.State in [dsInsert, dsEdit]) then
  Begin
    //se for diferente de serviço
    if (Trim(ind_tipo_produto) <> 'SERVIÇO') then
    begin
      wValorAtual := StrToFloat(DMOracle.BuscaNome('SELECT VAL_VAREJO FROM TB_PRODUTO','COD_PRODUTO='+DMOrdemServico.QOrdemServicoItCOD_PRODUTO.Text));
      If DMOrdemServico.QOrdemServicoItVL_UNITARIO.Value < wValorAtual then
      begin
        if FSenha = nil then
          FSenha := TFSenha.Create(Application);
        FSenha.BitBtn2.Visible := False;
        if FSenha.ShowModal = MrOk then
          if UpperCase(Trim(FSenha.EdSenha.Text)) <> UpperCase(DmParamSistema.QParamSistemaDesc_Senha_Oficina.Value) then
          Begin
            DBPanel14.SetFocus;
            DMOrdemServico.QOrdemServicoItVL_UNITARIO.Value := StrToFloat(DMOracle.BuscaNome('SELECT VAL_VAREJO FROM'+
                                             ' TB_PRODUTO','COD_PRODUTO='+DMOrdemServico.QOrdemServicoItCOD_PRODUTO.Text));
            DBPanel20.SetFocus;
            raise Exception.Create('Usuário sem permissão para Alterar preços!');
          end;
      end;      
    end;
    SBConfirmar.Enabled := True;
    Confirmar1.Enabled := True;
  end;         
end;

procedure TFOrdemServicoCad.DBPanel19DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FMensagemCons;
  Classe := TFMensagemCons;
end;

Procedure TFOrdemServicoCad.ImprimeEtiquetaOS;
var
  ret,nLen : integer;
  pbuf : array[0..127] of AnsiChar;
  ver : PAnsiChar;
  strmsg : string;
  len1,len2 : integer;
  buf1,buf2 : AnsiString;
  buff1 : array[0..127] of WideChar;
  wFone,wCliente : string;
Begin
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Text = 'NIR' then
  Begin
    wFone := DMOracle.BuscaNome('SELECT DECODE(DESC_CELULAR,NULL,DESC_TELEFONE,DESC_CELULAR) FROM TB_CADASTRO','COD_CADASTRO='+ DMOrdemServico.QOrdemServicoCOD_CADASTRO.Text);
    WCliente := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO='+ DMOrdemServico.QOrdemServicoCOD_CADASTRO.Text);
    nLen := A_GetUSBBufferLen() + 1;
    len1 := 128;
    len2 := 128;
    SetLength(buf1,len1);
    SetLength(buf2,len2);
    A_EnumUSB(pbuf);
    A_GetUSBDeviceInfo(1, PAnsiChar(buf1), @len1, PAnsiChar(buf2), @len2);
    ret := A_CreatePrn(12, PAnsiChar(buf2));   // open usb.
    A_Set_Darkness(12); //escurece a impresssao. 

    A_Prn_Text(043, 065, 1, 1, 0, 2, 2, 'n', 2, pchar('CEMAPA'));//diminui 5 pontos no segundo parâmetro em todas as linhas(Saindo cortado inicio da etiqueta).
    A_Prn_Text(016, 043, 1, 2, 0, 1, 2, 'n', 2, pchar('O.S. '+DMOrdemServico.QOrdemServicoCOD_ORDEM_SERVICO_CAB.Text));
    A_Prn_Text(016, 027, 1, 1, 0, 1, 2, 'n', 2, pchar(Copy(wCliente,1,28)));
    A_Prn_Text(016, 013, 1, 1, 0, 1, 2, 'n', 2, pchar('Tel.:'+wFone));
    A_Prn_Text(016, 002, 1, 1, 0, 1, 2, 'n', 2, pchar('Ent.:'+DMOrdemServico.QOrdemServicoDT_ENTRADA.Text));

    A_Prn_Text(185, 065, 1, 1, 0, 2, 2, 'n', 2, pchar('CEMAPA'));
    A_Prn_Text(157, 043, 1, 2, 0, 1, 2, 'n', 2, pchar('O.S. '+DMOrdemServico.QOrdemServicoCOD_ORDEM_SERVICO_CAB.Text));
    A_Prn_Text(157, 027, 1, 1, 0, 1, 2, 'n', 2, pchar(Copy(wCliente,1,28)));
    A_Prn_Text(157, 013, 1, 1, 0, 1, 2, 'n', 2, pchar('Tel.:'+wFone));
    A_Prn_Text(157, 002, 1, 1, 0, 1, 2, 'n', 2, pchar('Ent.:'+DMOrdemServico.QOrdemServicoDT_ENTRADA.Text));

    A_Prn_Text(320, 065, 1, 1, 0, 2, 2, 'n', 2, pchar('CEMAPA'));
    A_Prn_Text(300, 043, 1, 2, 0, 1, 2, 'n', 2, pchar('O.S. '+DMOrdemServico.QOrdemServicoCOD_ORDEM_SERVICO_CAB.Text));
    A_Prn_Text(300, 028, 1, 1, 0, 1, 2, 'n', 2, pchar(Copy(wCliente,1,28)));
    A_Prn_Text(300, 013, 1, 1, 0, 1, 2, 'n', 2, pchar('Tel.:'+wFone));
    A_Prn_Text(300, 002, 1, 1, 0, 1, 2, 'n', 2, pchar('Ent.:'+DMOrdemServico.QOrdemServicoDT_ENTRADA.Text));

    A_Set_Backfeed(320);
    A_Print_Out(1, 1, 1, 1);
    A_ClosePrn;
  end;
end;
Procedure TFOrdemServicoCad.ImprimeEtiquetaGEOPRO;
var
  ret,nLen : integer;
  pbuf : array[0..127] of AnsiChar;
  ver : PAnsiChar;
  strmsg : string;
  len1,len2 : integer;
  buf1,buf2 : AnsiString;
  buff1 : array[0..127] of WideChar;
  wFone,wCliente, wCidade, wEstado : string;
Begin
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Text = 'GEOPRO' then
  Begin
    WCliente := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO='+ DMOrdemServico.QOrdemServicoCOD_CADASTRO.Text);
    wCidade := DMOracle.BuscaNome('SELECT DESC_CIDADE FROM TB_CIDADE','COD_CIDADE =' + DMOrdemServico.QOrdemServicoCOD_CIDADE_PRESTACAO.Text);
    wEstado := DMOracle.BuscaNome('SELECT COD_ESTADO FROM  TB_CIDADE','COD_CIDADE =' + DMOrdemServico.QOrdemServicoCOD_CIDADE_PRESTACAO.Text);
    nLen := A_GetUSBBufferLen() + 1;
    len1 := 128;
    len2 := 128;
    SetLength(buf1,len1);
    SetLength(buf2,len2);
    A_EnumUSB(pbuf);
    A_GetUSBDeviceInfo(1, PAnsiChar(buf1), @len1, PAnsiChar(buf2), @len2);
    ret := A_CreatePrn(12, PAnsiChar(buf2));   // open usb.
    A_Set_Darkness(12); //escurece a impresssao. 

    A_Prn_Text_TrueType(010, 120, 30, 'Arial', 1, 400, 0, 0, 0, 'nn', pchar(Copy(wCliente,1,28)), 1);
    A_Prn_Text_TrueType(010,  50, 30, 'Arial', 1, 400, 0, 0, 0, 'n',  pchar(DMOrdemServico.QOrdemServicoDESC_SOLICITACAO.Text), 1);
    A_Prn_Text_TrueType(016, 007, 30, 'Arial', 1, 400, 0, 0, 0, 'AA', pchar(wCidade + '-' + wEstado), 1);
    A_Set_Backfeed(320);
    A_Print_Out(1, 1, 1, 1);
    A_ClosePrn;
  end;
end;

procedure TFOrdemServicoCad.ImprimeEtiquetaOS_EPL;
var
  wContEtiquetas, i, wQtdEtiquetas: integer;
  wString : TStringList;
  wFone,wCliente : string;
const
  arquivo = 'C:\Temp\etiqueta.prn';
begin
  inherited;
  DMParamSistema.QParamSistema.open;
  DMUsuario.QUsuario.Open;
  wString := TStringList.create;
  wString.clear;
  i := 0;
  if (Trim(DMUsuario.QUsuarioDESC_IMPRESSORA_ZEBRA_EPL.Text) = '') then
    raise exception.Create('Configure a sua impressora Zebra no Cadastro de Usúario. Ex.:\\localhost\nomeimpressora');
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Text = 'NIR' then
  Begin
    wFone := DMOracle.BuscaNome('SELECT DECODE(DESC_CELULAR,NULL,DESC_TELEFONE,DESC_CELULAR) FROM TB_CADASTRO','COD_CADASTRO='+ DMOrdemServico.QOrdemServicoCOD_CADASTRO.Text);
    WCliente := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO='+ DMOrdemServico.QOrdemServicoCOD_CADASTRO.Text);
    wString.Add('I8,A,001');
    wString.Add('');
    wString.Add('');
    wString.Add('Q176,024');
    wString.Add('q831');
    wString.Add('rN');
    wString.Add('S3');
    wString.Add('D8');
    wString.Add('ZT');
    wString.Add('JF');
    wString.Add('O');
    wString.Add('R0,0');
    wString.Add('f100');
    wString.Add('N');
    //1 coluna  
    wString.Add('A184,165,2,4,1,1,N,"CEMAPA"');//DMParamSistema.QParamSistemaDESC_EMPRESA.Text
    wString.Add('A235,130,2,4,1,1,N,"O.S.'+DMOrdemServico.QOrdemServicoCOD_ORDEM_SERVICO_CAB.Text+'"'); //255
    wString.Add('A235,96,2,2,1,1,N,"'+copy(wCliente,1,21)+'"');
    wString.Add('A235,69,2,2,1,1,N,"Tel.:'+wFone+'"');//245
    wString.Add('A235,40,2,2,1,1,N,"Ent.:'+DMOrdemServico.QOrdemServicoDT_ENTRADA.Text+'"');
    //2 coluna
    wString.Add('A474,165,2,4,1,1,N,"CEMAPA"');
    wString.Add('A520,130,2,4,1,1,N,"O.S.'+DMOrdemServico.QOrdemServicoCOD_ORDEM_SERVICO_CAB.Text+'"');//544
    wString.Add('A520,96,2,2,1,1,N,"'+copy(wCliente,1,21)+'"');
    wString.Add('A520,69,2,2,1,1,N,"Tel.:'+wFone+'"');
    wString.Add('A520,40,2,2,1,1,N,"Ent.:'+DMOrdemServico.QOrdemServicoDT_ENTRADA.Text+'"');
    //3 coluna
    wString.Add('A759,165,2,4,1,1,N,"CEMAPA"');
    wString.Add('A800,130,2,4,1,1,N,"O.S.'+DMOrdemServico.QOrdemServicoCOD_ORDEM_SERVICO_CAB.Text+'"');//824
    wString.Add('A800,96,2,2,1,1,N,"'+copy(wCliente,1,21)+'"');
    wString.Add('A800,69,2,2,1,1,N,"Tel.:'+wFone+'"');
    wString.Add('A800,40,2,2,1,1,N,"Tel.:'+DMOrdemServico.QOrdemServicoDT_ENTRADA.Text+'"');
    wString.Add('P1');
    try
      wString.SaveToFile(arquivo); //gera arquivo texto com o conteúdo que será enviado para a impressora
      //Para usar USB tem que compartilhar a impressora e enviar o arquivo para o compartilhamento
      ShellExecute(Handle, 'open', PChar('cmd.exe'), PChar('/c type '+ arquivo +' > '+ DMUsuario.QUsuarioDESC_IMPRESSORA_ZEBRA_EPL.Text), nil, SW_HIDE);
    finally
      Sleep(1000);//estava 500
      wString.Clear;
    if FileExists(arquivo) then
      DeleteFile(arquivo);
    end;
  end;

end;


procedure TFOrdemServicoCad.DBPanel15Exit(Sender: TObject);
begin
  inherited;
  if DMOrdemServico.QOrdemServicoItVAL_DESCONTO.Value <> 0 then
    DMOrdemServico.QOrdemServicoItPERC_DESCONTO.Value := (DMOrdemServico.QOrdemServicoItVAL_DESCONTO.value * 100) /
      DMOrdemServico.QOrdemServicoItVL_UNITARIO.Value;
end;

procedure TFOrdemServicoCad.DBPanel20Exit(Sender: TObject);
begin
  inherited;
  if DMOrdemServico.QOrdemServicoItPERC_DESCONTO.Value <> 0 then
  begin
    if TComponent(Sender).Name = 'DBPProduto' then
      DSItens.DataSet.Edit;
    DMOrdemServico.QOrdemServicoItVAL_DESCONTO.Value :=
      DMOrdemServico.QOrdemServicoItVL_UNITARIO.Value * DMOrdemServico.QOrdemServicoItPERC_DESCONTO.Value / 100;
    if TComponent(Sender).Name = 'DBPProduto' then
      DSItens.DataSet.Post;
  end;
end;

procedure TFOrdemServicoCad.DBPanel13CodigoExit(Sender: TObject);
var wQtdMinima: double;
    wQtdEstoque: double;
begin
  inherited;
  DBPanel20Exit(Sender);
end;

procedure TFOrdemServicoCad.CBSenhaClick(Sender: TObject);
begin
  inherited;
  if CBSenha.Checked then
  begin
    DMOrdemServico.QOrdemServicoDESC_SENHA_EQUIPAMENTO.Value := 'SEM SENHA';
    DBSenhaEquipamento.Enabled := false;
  end
  else
  begin
    DMOrdemServico.QOrdemServicoDESC_SENHA_EQUIPAMENTO.Value := '';
    DBSenhaEquipamento.Enabled := true;
  end;
  
end;

procedure TFOrdemServicoCad.DBCBEmailClick(Sender: TObject);
begin
  inherited;
  DBPSenhaEmail.Enabled := DBCBEmail.Checked;
  DBPSenhaEmail.Required := DBCBEmail.Checked;
end;

procedure TFOrdemServicoCad.DBCBSenhaWindowsClick(Sender: TObject);
begin
  inherited;
//  DBPSenhaWindows.Enabled := DBCBSenhaWindows.Checked;
//  DBPSenhaWindows.Required := DBCBSenhaWindows.Checked;
end;

procedure TFOrdemServicoCad.DBCBCertificadoClick(Sender: TObject);
begin
  inherited;
  DBCBInstalarCertificados.Enabled := DBCBCertificado.Checked;
  if not DBCBCertificado.Checked then
    DBCBInstalarCertificados.Checked := False;
end;

procedure TFOrdemServicoCad.SBVeiculoClick(Sender: TObject);
begin
  inherited;
    if FVeiculoCons = nil then
    FVeiculoCons := TFVeiculoCons.Create(Application);
  if FVeiculoCons.showModal = mrOk then
  begin
    MePlaca.Text := DMVeiculo.QVeiculoConsNUM_PLACA.Value;
    if (DMParamSistema.CodEmpresa = 'PATELI') or (DMParamSistema.CodEmpresa = 'ALFA') or (DMParamSistema.CodEmpresa = 'RENATOAUTO')  then 
    begin
      DMOrdemServico.QOrdemServicoCOD_VEICULO.Value := DMVeiculo.QVeiculoConsCOD_VEICULO.Value;
      EdModelo.Text := DMVeiculo.QVeiculoConsDESC_MODELO.Value;
    end;
    MePlacaExit(Sender);
  end;
end;

procedure TFOrdemServicoCad.MePlacaExit(Sender: TObject);
var
  wCodModelo: integer;
  wIndVenda: String;
  wPlaca : String;
begin
  inherited;
  if (Trim(MePlaca.Text) <> '-') then //and (DBPanel8.DBEdit.Text = '') then  //Não mudava veículo, comentei essa linha. Junior 10/04/2023
  begin
    with DMVeiculo, DMOrdemServico do
    begin
      QVeiculoCons.close;
      QVeiculoCons.SetVariable('NUM_PLACA','%'+Trim(MePlaca.Text)+'%');
      QVeiculoCons.Open;
      if (QVeiculoCons.RecordCount > 0) then
      begin
        EdModelo.Text := QVeiculoConsDESC_MODELO.Text;
        QOrdemServicoCOD_VEICULO.Value := QVeiculoConsCOD_VEICULO.Value;
        QOrdemServicoKM_CHEGADA.Value := QVeiculoConsKM_ATUAL.Value;

        if (DMParamSistema.CodEmpresa <> 'RETIFOZ') and (DMParamSistema.CodEmpresa <> 'PATELI') and (DMParamSistema.CodEmpresa <> 'ALFA') then
        begin
          if QOrdemServico.State in [dsInsert,dsEdit] then //Função é chamada na consulta da O.S para preencher o modelo do veículo e para não mudar o cód. do cadastro na tela coloquei essa verificação. Junior-26/06/2019.
            QOrdemServicoCOD_CADASTRO.Value := QVeiculoConsCOD_CADASTRO.Value;
        end;
      end
      else
      begin
        if DMParamSistema.CodEmpresa = 'REGINATO' then //cadastro automático de veículo para REGINATO - Junior 17/11/2017
        begin
           if DMOrdemServico.QOrdemServicoCOD_CADASTRO.Text = '' then
           begin
             MEPlaca.Clear;
             Raise Exception.Create('Informar o cliente antes de informar a placa.');
           end
           else
           begin
             DMVeiculo.QVeiculoCad.Open;
             DMVeiculo.QVeiculoCad.Insert;
             DMVeiculo.QVeiculoCadNUM_PLACA.Value := MEPlaca.Text;
             DMVeiculo.QVeiculoCadCOD_CADASTRO.Value := QOrdemServicoCOD_CADASTRO.Value;
             DMVeiculo.QVeiculoCadCOD_MODELO.Value := 1;
             DMVeiculo.QVeiculoCad.Post;
             QVeiculoCons.close;
             QVeiculoCons.SetVariable('NUM_PLACA',Trim(MePlaca.Text));
             QVeiculoCons.Open;
             if QVeiculoCons.RecordCount > 0 then
             begin
               EdModelo.Text := QVeiculoConsDESC_MODELO.Text;
               QOrdemServicoCOD_VEICULO.Value := QVeiculoConsCOD_VEICULO.Value;
               QOrdemServicoCOD_CADASTRO.Value := QVeiculoConsCOD_CADASTRO.Value;
             end;
           end;
        end
        else
        if (MessageDlg('Veículo não cadastrado. Deseja cadastrar?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
        begin
          if FVeicCad = Nil then
            FVeicCad := TFVeicCad.Create(Application);
          FVeicCad.SBConsulta.Enabled := false;
          DMOracle.DBCemapa.Rollback;//Necessário em caso de abrir a tela de cad. veiculo e fechar sem realizar o cadastro. (Pau de DataSet). Junior 22/05/2017.
          FVeicCad.ShowModal;
          MEPlaca.SetFocus;
        end
        else
        begin
          EdModelo.Clear;
        end;
      end;
    end;
  end
//Adicionado para que seja possível remover o veículo da O.S. Alex 10/08/2022
//Como a pateli possui alguns veículos cadastrados sem placa, para eles a remoção não é realizada aqui. 
  else
  begin
    if ( (DMParamSistema.CodEmpresa = 'PATELI') or (DMParamSistema.CodEmpresa = 'ALFA') ) and (DBPanel8.DBEdit.Text = '') then
    begin
      EdModelo.Clear;
      DBPanel8.DBEdit.Clear;
      MEPlaca.Clear;
      DMOrdemServico.QOrdemServicoCOD_VEICULO.Text := '';
    end;
//Fim para a Pateli
    if ( (DMParamSistema.CodEmpresa <> 'PATELI') and (DMParamSistema.CodEmpresa <> 'ALFA') )and (DBPanel8.DBEdit.Text <> '') and (Trim(MePlaca.Text) = '-') then
    begin
      EdModelo.Clear;
      DBPanel8.DBEdit.Clear;
      MEPlaca.Clear;
      DMOrdemServico.QOrdemServicoCOD_VEICULO.Text := '';    
    end;
  end;

  //Gian 23/01/2018, Solicitado por Junior, informa o cliente caso classifcação do cadastro não possa fazer venda
  if DMOrdemServico.QOrdemServicoCOD_CADASTRO.Text <> '' then
  begin
    wIndVenda := DMOracle.BuscaNome('SELECT IND_VENDA FROM TB_CLASS_CADASTRO CL, TB_CADASTRO CD','CD.COD_CLASS_CADASTRO = CL.COD_CLASS_CADASTRO AND COD_CADASTRO = '+ DMOrdemServico.QOrdemServicoCOD_CADASTRO.Text);
    if wIndVenda = 'N' then
      ShowMessage('Cadastro possui classificação não permitida para vendas, por favor verifique...');
  end;
end;

procedure TFOrdemServicoCad.MELocalizaExit(Sender: TObject);
begin
  inherited;
  with DMOrdemServico do
  if (QOrdemServico.RecordCount > 0) and (QOrdemServicoCOD_VEICULO.Value > 0 ) then
  begin
    MePlaca.Text := DMOracle.FastSelect('NUM_PLACA','TB_VEICULO','COD_VEICULO = ' + QOrdemServicoCOD_VEICULO.Text);
    MePlacaExit(Sender);
  end
  else
  begin
    MEPlaca.Clear;
    EdModelo.Clear;
  end;
  {if DMParamSistema.CodEmpresa = 'RETIFOZ' then
    LeDescontoRetifoz;}

  if (DMParamSistema.CodEmpresa = 'CENTERFRIO') or (DMParamSistema.CodEmpresa = 'GEOPRO') then
  begin
    if DMOrdemServico.QOrdemServicoCOD_ORDEM_SERVICO_CAB.AsString <> '' then
    begin
      EdNumNfe.Text :=  DMOracle.FastSelect('NUM_NOTA','TB_NOTA_CAB','COD_ORDEM_SERVICO_CAB = ' + DMOrdemServico.QOrdemServicoCOD_ORDEM_SERVICO_CAB.Text
                                            + ' and COD_SERIE_MODELO <> '+ QuotedStr('98'));
      EdNumNfse.Text := DMOracle.FastSelect('NUM_NFSE','TB_NOTA_CAB','COD_ORDEM_SERVICO_CAB = ' + DMOrdemServico.QOrdemServicoCOD_ORDEM_SERVICO_CAB.Text);
    end;
  end
  else
  begin
   EdNumNfe.Clear;
   EdNumNfse.Clear;
  end;
  if (DMOrdemServico.QOrdemServicoCOD_CADASTRO.Text <> '') then
  begin
    EdNomeFantasia.Text := DMOracle.FastSelect('DESC_FANTASIA','TB_CADASTRO','COD_CADASTRO = ' + DMOrdemServico.QOrdemServicoCOD_CADASTRO.Text);
    METelefone.EditText := DMOracle.FastSelect('DESC_TELEFONE','TB_CADASTRO','COD_CADASTRO = ' + DMOrdemServico.QOrdemServicoCOD_CADASTRO.Text);
    MECelular.EditText := DMOracle.FastSelect('DESC_CELULAR','TB_CADASTRO','COD_CADASTRO = ' + DMOrdemServico.QOrdemServicoCOD_CADASTRO.Text);
  end;
end;

procedure TFOrdemServicoCad.SBIncluirClick(Sender: TObject);
var
  wMensagem: string;
begin
  inherited;
  PCOrdemServico.ActivePage := TSCab;
  MEPlaca.Clear;
  EdModelo.Clear;
  EdNomeFantasia.Clear;
  METelefone.Clear;
  MECelular.Clear;

  if (DMParamSistema.CodEmpresa = 'FURGOESMED')  then
  begin
    MEPlaca.EditMask := '>lll\-AC99;1;_';
    MEPlaca.SetFocus;
  end;
  if (DMParamSistema.CodEmpresa = 'RETIFOZ') or (DMParamSistema.CodEmpresa = 'RRPECAS') or (DMParamSistema.CodEmpresa = 'RSMECANICA') or
     (DMParamSistema.CodEmpresa = 'RENATOAUTO') then
  begin
    MEDescPecasPerc.Enabled := true;
    MEDescServicosPerc.Enabled := true;
    MEDescPecasPerc.Text := '0,00';
    MEDescServicosPerc.Text := '0,00';
    MEDescPecas.Text := '0,00';
    MEDescServicos.Text := '0,00';
  end;
{Para trazer a mensagem que esta na operação. Alex 29/04/2026}
  with DMOrdemServico do
  begin
    if (QOrdemServicoCOD_OPERACAO.Text <> '') then
    begin
      wMensagem := DMOracle.FastSelect('COD_MENSAGEM','TB_OPERACAO','COD_OPERACAO = ' + QOrdemServicoCOD_OPERACAO.Text);
      DBPanel19.DBEdit.Text := wMensagem;
    end;
  end;
end;

procedure TFOrdemServicoCad.EdNumFabricanteExit(Sender: TObject);
var mNumeroFabricante: string;
begin
  inherited;
  mNumeroFabricante := ''; // Inicializa valor do numero fabricante.
  if Trim(EdNumFabricante.Text) <> '' then
  begin
    mNumeroFabricante := DMOracle.BuscaNome('SELECT COD_PRODUTO FROM TB_PRODUTO', 'NUM_FABRICANTE = ' + chr(39) + Trim(EdNumFabricante.Text) + chr(39), True);
    if Trim(mNumeroFabricante) = '' then
      EdNumFabricante.Text := mNumeroFabricante
    else
    begin
      if (DSItens.State = dsBrowse) and (DMOrdemServico.QOrdemServicoItCOD_PRODUTO.Value = 0) then
        DMOrdemServico.QOrdemServicoIt.Insert;
      if (DSItens.State = dsBrowse) and (DMOrdemServico.QOrdemServicoItCOD_PRODUTO.Value > 0) then
        DMOrdemServico.QOrdemServicoIt.Edit;
      DMOrdemServico.QOrdemServicoItCOD_PRODUTO.Value := StrToInt(mNumeroFabricante);
    end;
    DBPProduto.OnCodigoExit(Sender);
    EdNumFabricante.Text := '';
    DBPanel13.SetFocus;
  end;
end;

procedure TFOrdemServicoCad.Oramento1Click(Sender: TObject);
begin
  inherited;
  with DMOrdemServico, DMParamSistema do
  begin
    QrOrcamentoOS.Close;
    if (DBPanel2.DBEdit.Text = '') then
      raise Exception.Create('Selecione um Orçamento.');
    if (QParamSistemaIND_IMPRIME_DESCONTO_OS.Value = 'N') then
    begin
      QrOrcamentoOS.SetVariable('COD_ORDEM_SERVICO', DBPanel2.DBEdit.Text);
      QrOrcamentoOS.Open;
      if FROrcamentoOS = nil then
        FROrcamentoOS := TFROrcamentoOS.Create(Application);
      //Suporte(9810) - MedFrig solicitou a logo. Fiz para todos. Caso não tiver logo, irá aparecer a mensagem sem logo. Junior 17/09/2020
      if FileExists(ExtractFilePath(Application.ExeName) + 'logo\logo.jpg') then
      begin
        FROrcamentoOS.QRILogo.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'logo\logo.jpg');
        FROrcamentoOS.QRLLogo.Enabled := False;
      end
      else
      begin
        FROrcamentoOS.QRILogo.Picture := Nil;
        FROrcamentoOS.QRLLogo.Enabled := True;
      end;
      if CodEmpresa = 'GEOPRO' then
      begin
        //FROrcamentoOS.QRDBText7.Enabled := False;
        FROrcamentoOS.QRDBText20.Enabled := False;
        FROrcamentoOS.QRLabel29.Enabled := True;
        FROrcamentoOS.QRLabel29.Caption := QParamSistemaDESC_EMPRESA.Text;
        FROrcamentoOS.QRLabel1.Caption := QParamSistemaDESC_EMPRESA.Text;
      end;
      if CodEmpresa = 'JOFER' then
      begin
        FROrcamentoOS.QRLabel9.Enabled := False;
        FROrcamentoOS.QRDBText16.Enabled := False;
        FROrcamentoOS.QRLabel4.Left := 68;
        FROrcamentoOS.QRDBText2.Left := 68;
        FROrcamentoOS.QRDBText2.Width := 400;
      end;
      FROrcamentoOS.QRPrimario.Preview;
      QrOrcamentoOS.Close;
    end
    else
    begin
      if (MessageDlg('Deseja imprimir o valor do desconto no Orçamento da O.S.?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
      begin
        QrOrcamentoOS.SetVariable('COD_ORDEM_SERVICO', DBPanel2.DBEdit.Text);
        QrOrcamentoOS.Open;
        if FROrcamentoOS = nil then
          FROrcamentoOS := TFROrcamentoOS.Create(Application);
        if FileExists(ExtractFilePath(Application.ExeName) + 'logo\logo.jpg') then
        begin
          FROrcamentoOS.QRILogo.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'logo\logo.jpg');
          FROrcamentoOS.QRLLogo.Enabled := False;
        end
        else
        begin
          FROrcamentoOS.QRILogo.Picture := Nil;
          FROrcamentoOS.QRLLogo.Enabled := True;
        end;
        FROrcamentoOS.QRPrimario.Preview;
        QrOrcamentoOS.Close;
      end
      else
      begin
        QrOrcamentoOsSemDesc.SetVariable('COD_ORDEM_SERVICO', DBPanel2.DBEdit.Text);
        QrOrcamentoOsSemDesc.Open;
        if FROrcamentoOsSemDesconto = nil then
          FROrcamentoOsSemDesconto := TFROrcamentoOsSemDesconto.Create(Application);
        if FileExists(ExtractFilePath(Application.ExeName) + 'logo\logo.jpg') then
        begin
          FROrcamentoOsSemDesconto.QRILogo.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'logo\logo.jpg');
          FROrcamentoOsSemDesconto.QRLLogo.Enabled := False;
        end
        else
        begin
          FROrcamentoOsSemDesconto.QRILogo.Picture := Nil;
          FROrcamentoOsSemDesconto.QRLLogo.Enabled := True;
        end;
        FROrcamentoOsSemDesconto.QRPrimario.Preview;
        QrOrcamentoOsSemDesc.Close;
      end;
    end;
  end;
end;

procedure TFOrdemServicoCad.EdNumFabricanteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key = VK_F12 then
  begin
    if FProdutoCons = nil then
      FProdutoCons := TFProdutoCons.Create(Application);
    if FProdutoCons.ShowModal = mrOk then
    begin
      DMOrdemServico.QOrdemServicoItCOD_PRODUTO.Value := DMProduto.QProdutoConsCOD_PRODUTO.AsInteger;
      DBPProdutoCodigoExit(Self);
    end;
  end;
end;

procedure TFOrdemServicoCad.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Key = VK_INSERT) and (PCOrdemServico.TabIndex = 1) and (BtIncluir.Enabled) then
    BtIncluirClick(Self);
  if (Key = VK_ESCAPE) and (PCOrdemServico.TabIndex = 1) and (BtCancelar.Enabled) then
    BtCancelarClick(Self);
end;

procedure TFOrdemServicoCad.IniciarManuteno1Click(Sender: TObject);
var
  exec : TExecutador;
  wData : String;
begin
  inherited;
  with DMOrdemServico do
  begin
    wData := FormatDateTime('dd/mm/yy', Now);
    exec := TExecutador.Create;
    exec.Adiciona('UPDATE TB_ORDEM_SERVICO_CAB SET DT_ENTRADA_MANUTENCAO='
      + QuotedStr(wData) +' WHERE COD_ORDEM_SERVICO_CAB = '
      + QOrdemServicoCOD_ORDEM_SERVICO_CAB.Text);
    exec.Executar(True, True);
    QOrdemServico.Close;
    QOrdemServico.Open;
   end;
   IniciarManuteno1.Enabled := False;
end;

procedure TFOrdemServicoCad.FinalizarServio1Click(Sender: TObject);
var
  exec : TExecutador;
  wData : String;
begin
  inherited;
  with DMOrdemServico do
  begin
    wData := FormatDateTime('dd/mm/yy', Now);
    if (DMParamSistema.CodEmpresa = 'GEOPRO') then
    begin
      exec := TExecutador.Create;
      exec.Adiciona('UPDATE TB_ORDEM_SERVICO_CAB SET IND_SITUACAO_OS='
        + QuotedStr('FINALIZADA') + ',DT_SAIDA_MANUTENCAO=' + QuotedStr(wData) +
        ' WHERE COD_ORDEM_SERVICO_CAB = '
        + QOrdemServicoCOD_ORDEM_SERVICO_CAB.Text);
      exec.Executar(True, True);
      QOrdemServico.Close;
      QOrdemServico.Open;
    end
    else
    begin
      exec := TExecutador.Create;
      exec.Adiciona('UPDATE TB_ORDEM_SERVICO_CAB SET DT_SAIDA_MANUTENCAO='
        + QuotedStr(wData) +' WHERE COD_ORDEM_SERVICO_CAB = '
        + QOrdemServicoCOD_ORDEM_SERVICO_CAB.Text);
      exec.Executar(True, True);
      QOrdemServico.Close;
      QOrdemServico.Open;
      EnviarSMS1Click(Self);
    end;
  end;

end;

procedure TFOrdemServicoCad.DBPanel14Enter(Sender: TObject);
begin
  inherited;
  if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'TRENTO')
    and (DSPrimario.State in [dsInsert, dsEdit]) then
  begin
    SBConfirmar.Enabled := False;
    Confirmar1.Enabled := False;
  end;
end;

procedure TFOrdemServicoCad.DBPVencimentoDefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FPrazoVencimentoCons;
  Classe := TFPrazoVencimentoCons;
end;

procedure TFOrdemServicoCad.ValidaQuantidadeMinima;
var wQtdMinima, wQtdEstoque : double;
    wTipoProduto : String;
begin
  wQtdMinima := StrToFloat('0'+DMOracle.FastSelect('NVL(QT_MINIMO,0)','TB_ESTOQUE','COD_PRODUTO = ' +DMOrdemServico.QOrdemServicoItCOD_PRODUTO.Text +
                                               'AND COD_FILIAL = ' + DMOrdemServico.QOrdemServicoCOD_FILIAL.Text));
  wQtdEstoque := StrToFloat('0'+DMOracle.FastSelect('NVL(QT_QUANTIDADE,0)','TB_ESTOQUE','COD_PRODUTO = ' +DMOrdemServico.QOrdemServicoItCOD_PRODUTO.Text +
                                               'AND COD_FILIAL = ' + DMOrdemServico.QOrdemServicoCOD_FILIAL.Text));
  wTipoProduto := DMOracle.FastSelect('IND_TIPO_PRODUTO','TB_PRODUTO','COD_PRODUTO = ' +DMOrdemServico.QOrdemServicoItCOD_PRODUTO.Text);

  if (wTipoProduto <> 'SERVIÇO') then
  begin
    if (wQtdEstoque - DMOrdemServico.QOrdemServicoItQT_PRODUTO.Value)  <= wQtdMinima  then
      ShowMessage(DMOrdemServico.QOrdemServicoItCOD_PRODUTO.Text + '-' + DMOrdemServico.QOrdemServicoItnome_produto.Text + #13#10 +
                   'Limite não cadastrado ou chegou ao limite ' + floatToStr(wQtdMinima));
  end;
end;

// Para empresas que controlam o estoque na ordem de serviço
procedure TFOrdemServicoCad.ControleEstoqueOS(Sender: TObject);
begin
  if DMParamSistema.QParamSistemaIND_CONTROLE_ESTOQUE_OS.Value = 'SIM' then
  begin
    with DMOrdemServico, DMEstoque do
    begin
      QOrdemServicoIt.DisableControls;
      if Pos('Confirmar', TSpeedButton(Sender).Name) > 0  then
      begin
        QOrdemServicoIt.First;
        If Not DMOracle.DBCemapa.InTransaction Then
          DMOracle.DBCemapa.StartTransaction;
        while not QOrdemServicoIt.Eof do
        begin
          if QOrdemServicoItCOD_LOTE_TIPO.Value = 0 then
          begin
            Raise Exception.Create('Lote do produto não informado. Impossível baixar estoque.');
          end;
          try
            AtualizaEstoque(-2
              , QOrdemServicoCOD_FILIAL.Value
              , QOrdemServicoItCOD_PRODUTO.Value
              , QOrdemServicoItCOD_LOTE_TIPO.Value
              , (QOrdemServicoItQT_PRODUTO.Value * -1)
              , QOrdemServicoItVL_UNITARIO.Value
              , 0
              , QOrdemServicoDT_ENTRADA.Value);
          Except
            // Se ocorreu erro de atualização de estoque
            // Deve voltar os estoques previamente baixados na sessão
//            while QOrdemServicoIt.RecNo > 1 do
//            begin
//              QOrdemServicoIt.Prior;
//              AtualizaEstoque(-2
//                , QOrdemServicoCOD_FILIAL.Value
//                , QOrdemServicoItCOD_PRODUTO.Value
//                , QOrdemServicoItCOD_LOTE_TIPO.Value
//                , (QOrdemServicoItQT_PRODUTO.Value)
//                , QOrdemServicoItVL_UNITARIO.Value
//                , 0
//                , QOrdemServicoDT_ENTRADA.Value);
//            end;
            DMOracle.DBCemapa.Rollback;
            raise;
          end;
          QOrdemServicoIt.Next;
        end;
        DMOracle.DBCemapa.Commit;
        QOrdemServicoIt.First;
      end;
      if Pos('Alterar', TSpeedButton(Sender).Name) > 0 then
      begin
        QOrdemServicoIt.First;
        If Not DMOracle.DBCemapa.InTransaction Then
          DMOracle.DBCemapa.StartTransaction;
        while not QOrdemServicoIt.Eof do
        begin
          try
            AtualizaEstoque(-2
              , QOrdemServicoCOD_FILIAL.Value
              , QOrdemServicoItCOD_PRODUTO.Value
              , QOrdemServicoItCOD_LOTE_TIPO.Value
              , (QOrdemServicoItQT_PRODUTO.Value)
              , QOrdemServicoItVL_UNITARIO.Value
              , 0
              , QOrdemServicoDT_ENTRADA.Value);
          Except
            // Se ocorreu erro na volta de estoque
            // Deve voltar os estoques previamente voltados na sessão
//            while QOrdemServicoIt.RecNo > 1 do
//            begin
//              QOrdemServicoIt.Prior;
//              AtualizaEstoque(-2
//                , QOrdemServicoCOD_FILIAL.Value
//                , QOrdemServicoItCOD_PRODUTO.Value
//                , QOrdemServicoItCOD_LOTE_TIPO.Value
//                , (QOrdemServicoItQT_PRODUTO.Value * -1)
//                , QOrdemServicoItVL_UNITARIO.Value
//                , 0
//                , QOrdemServicoDT_ENTRADA.Value);
//            end;
            DMOracle.DBCemapa.Rollback;
            raise;
          end;
          QOrdemServicoIt.Next;
        end;
        DMOracle.DBCemapa.Commit;
        QOrdemServicoIt.First;
      end;
      if Pos('Excluir', TSpeedButton(Sender).Name) > 0 then
      begin
        If Not DMOracle.DBCemapa.InTransaction Then
          DMOracle.DBCemapa.StartTransaction;
        try
          AtualizaEstoque(-2
            , QOrdemServicoCOD_FILIAL.Value
            , QOrdemServicoItCOD_PRODUTO.Value
            , QOrdemServicoItCOD_LOTE_TIPO.Value
            , (QOrdemServicoItQT_PRODUTO.Value)
            , QOrdemServicoItVL_UNITARIO.Value
            , 0
            , QOrdemServicoDT_ENTRADA.Value);
        Except
          // Se ocorreu erro na volta de estoque
          // Deve voltar os estoques
//          AtualizaEstoque(-2
//            , QOrdemServicoCOD_FILIAL.Value
//            , QOrdemServicoItCOD_PRODUTO.Value
//            , QOrdemServicoItCOD_LOTE_TIPO.Value
//            , (QOrdemServicoItQT_PRODUTO.Value * -1)
//            , QOrdemServicoItVL_UNITARIO.Value
//            , 0
//            , QOrdemServicoDT_ENTRADA.Value);
          DMOracle.DBCemapa.Rollback;
          raise;
        end;
        DMOracle.DBCemapa.Commit;
      end;
      if Pos('Cancelar', TSpeedButton(Sender).Name) > 0 then
      begin
        If Not DMOracle.DBCemapa.InTransaction Then
          DMOracle.DBCemapa.StartTransaction;
        // Utilizado para saber se ocorreu cancelamento de edição
        if TSpeedButton(Sender).Tag = 1 then
        begin
          QOrdemServicoIt.First;
          while not QOrdemServicoIt.Eof do
          begin
            try
              AtualizaEstoque(-2
                , QOrdemServicoCOD_FILIAL.Value
                , QOrdemServicoItCOD_PRODUTO.Value
                , QOrdemServicoItCOD_LOTE_TIPO.Value
                , (QOrdemServicoItQT_PRODUTO.Value * -1)
                , QOrdemServicoItVL_UNITARIO.Value
                , 0
                , QOrdemServicoDT_ENTRADA.Value);
            Except
              // Se ocorreu erro na volta de estoque
              // Deve voltar os estoques previamente voltados na sessão
//              while QOrdemServicoIt.RecNo > 1 do
//              begin
//                QOrdemServicoIt.Prior;
//                AtualizaEstoque(-2
//                  , QOrdemServicoCOD_FILIAL.Value
//                  , QOrdemServicoItCOD_PRODUTO.Value
//                  , QOrdemServicoItCOD_LOTE_TIPO.Value
//                  , (QOrdemServicoItQT_PRODUTO.Value)
//                  , QOrdemServicoItVL_UNITARIO.Value
//                  , 0
//                  , QOrdemServicoDT_ENTRADA.Value);
//              end;
              DMOracle.DBCemapa.Rollback;
              raise;
            end;
            QOrdemServicoIt.Next;
          end;
        end;
        DMOracle.DBCemapa.Commit;
        QOrdemServicoIt.First;
      end;
      QOrdemServicoIt.EnableControls;
    end;
  end;
end;

procedure TFOrdemServicoCad.Reimprimir1Click(Sender: TObject);
var wCodNotaCab, wResult: String;
    wLote: Integer;
begin
  inherited;
  wCodNotaCab := DMOracle.BuscaNome('SELECT COD_NOTA_CAB FROM TB_NOTA_CAB','COD_ORDEM_SERVICO_CAB = ' +
    DMOrdemServico.QOrdemServicoCOD_ORDEM_SERVICO_CAB.Text + ' AND COD_SERIE_MODELO = ''99''');
  if wCodNotaCab <> '' then
  begin
    DMNotaSaida.QNotaSaida.Close;
    DMNotaSaida.QNotaSaida.SetVariable('PK',wCodNotaCab);
    DMNotaSaida.QNotaSaida.Open;
    FNotaImpressao.EmiteNF(StrToInt(wCodNotaCab));
  end;

  wCodNotaCab := DMOracle.BuscaNome('SELECT COD_NOTA_CAB FROM TB_NOTA_CAB','COD_ORDEM_SERVICO_CAB = ' +
    DMOrdemServico.QOrdemServicoCOD_ORDEM_SERVICO_CAB.Text + ' AND COD_SERIE_MODELO = ''55''');

  if wCodNotaCab <> '' then
  begin
    DMNotaSaida.QNotaSaida.Close;
    DMNotaSaida.QNotaSaida.SetVariable('PK',wCodNotaCab);
    DMNotaSaida.QNotaSaida.Open;
    wResult := DMOracle.BuscaNome('SELECT ID_LOTE FROM TB_NF_ELETRONICA','COD_NOTA_CAB = '+DMNotaSaida.QNotaSaidaCod_Nota_Cab.Text);
    if wResult = '' then
      wLote := 0
    else
      wLote := StrToInt(wResult);
    FNotaImpressao.EmiteNF(StrToInt(wCodNotaCab), '', wLote);
  end;

  wCodNotaCab := DMOracle.BuscaNome('SELECT COD_NOTA_CAB FROM TB_NOTA_CAB','COD_ORDEM_SERVICO_CAB = ' +
    DMOrdemServico.QOrdemServicoCOD_ORDEM_SERVICO_CAB.Text + ' AND COD_SERIE_MODELO = ''98''');
  if wCodNotaCab <> '' then
  begin
    DMNotaSaida.QNotaSaida.Close;
    DMNotaSaida.QNotaSaida.SetVariable('PK',wCodNotaCab);
    DMNotaSaida.QNotaSaida.Open;
    wResult := DMOracle.BuscaNome('SELECT ID_LOTE FROM TB_NF_ELETRONICA','COD_NOTA_CAB = '+DMNotaSaida.QNotaSaidaCod_Nota_Cab.Text);
    if wResult = '' then
      wLote := 0
    else
      wLote := StrToInt(wResult);
    if wCodNotaCab <> '' then
      FNotaImpressao.EmiteNF(StrToInt(wCodNotaCab), '', wLote, True);
  end;
end;

procedure TFOrdemServicoCad.sbImprimeFichaInspecaoClick(Sender: TObject);
begin
  inherited;
  with DMOrdemServico do
  begin
    if QOrdemServico.RecordCount > 0 then
    begin
      QRFichaInspecao.Close;
      QRFichaInspecao.SetVariable('COD_ORDEM_SERVICO', QOrdemServicoCOD_ORDEM_SERVICO_CAB.Value);
      QRFichaInspecao.Open;

      if FRFichaInspecao = nil then
        FRFichaInspecao := TFRFichaInspecao.Create(Application);

      FRFichaInspecao.QRLTitulo.Caption := 'FICHA DE INSPEÇÃO';

      FRFichaInspecao.QRPrimario.Preview;
    end
    else
      Raise Exception.Create('Não há Ordem de Serviço aberta. Selecione para imprimir.');

  end;

end;

procedure TFOrdemServicoCad.DBGEquipamentoCellClick(Column: TColumn);
begin
  inherited;
  DMOrdemServico.CDSFichaInspecao.Edit;
end;

procedure TFOrdemServicoCad.DBGEquipamentoColExit(Sender: TObject);
begin
  inherited;
  DMOrdemServico.CDSFichaInspecao.Edit;
end;

procedure TFOrdemServicoCad.DBGEquipamentoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  DMOrdemServico.CDSFichaInspecao.Edit;
end;

procedure TFOrdemServicoCad.RateioDescontoRetifoz(ValDescServico, ValDescPecas: String);
var totValPecas, totValServico, percPecas, percServico,
  valCalcPecas, valCalcServ: Double;

begin

totValPecas := 0;
totValServico := 0;
percPecas := 0;
percServico := 0;

  DBGrid1.DataSource.DataSet.DisableControls;

  with DMOrdemServico do
  begin
    QSomaItemOS.Close;
    QSomaItemOS.SetVariable('COD_ORDEM_SERVICO_CAB', QOrdemServicoCOD_ORDEM_SERVICO_CAB.Value);
    QSomaItemOS.Open;

    totValServico := QSomaItemOSSVAL_TOTAL_SERVICOS.Value;
    totValPecas := QSomaItemOSSVAL_TOTAL.Value - QSomaItemOSSVAL_ACRESCIMO.Value;

    QOrdemServicoIt.Close;
    QOrdemServicoIt.SetVariable('COD_ORDEM_SERVICO_CAB', QOrdemServicoCOD_ORDEM_SERVICO_CAB.Value);
    QOrdemServicoIt.Open;

    if MEDescPecasPerc.Text <> EmptyStr then
      percPecas := StrToFloat(MEDescPecasPerc.Text)/100
    else
      percPecas := 0;

    if MEDescServicosPerc.Text <> EmptyStr then
      percServico := StrToFloat(MEDescServicosPerc.Text)/100
    else
      percServico := 0;

    QOrdemServicoIt.First;

    if not (QOrdemServico.State in [dsEdit, dsInsert]) then
        QOrdemServico.Edit;

    while not QOrdemServicoIt.Eof do
    begin
      QOrdemServicoIt.Edit;
      if (DMOracle.FastSelect('IND_TIPO_PRODUTO', 'TB_PRODUTO',
                'COD_PRODUTO = '+ QuotedStr(QOrdemServicoItCOD_PRODUTO.Text)) = 'SERVIÇO')
        and (ValDescServico <> '') then
      begin
        QOrdemServicoItVAL_DESCONTO.Value := (QOrdemServicoItVL_UNITARIO.Value * percServico);
        QOrdemServicoItPERC_DESCONTO.Value := (percServico * 100);
      end
      else if(DMOracle.FastSelect('IND_TIPO_PRODUTO', 'TB_PRODUTO',
                'COD_PRODUTO = '+ QuotedStr(QOrdemServicoItCOD_PRODUTO.Text)) <> 'SERVIÇO')
        and (ValDescPecas <> '') then
      begin
        QOrdemServicoItVAL_DESCONTO.Value := (QOrdemServicoItVL_UNITARIO.Value * percPecas);
        QOrdemServicoItPERC_DESCONTO.Value := (percPecas * 100);
      end;
      QOrdemServicoIt.Post;
      QOrdemServicoIt.Next;
    end;

    if QOrdemServico.State in [dsEdit, dsInsert] then
        QOrdemServico.Post;
  end;
  DBGrid1.DataSource.DataSet.EnableControls;

  //MEDescServicoPerc.Text := FloatToStr(Round(difServ));
 // MEDescPecasPerc.Text := FloatToStr(Round(difPeca));

  LeDescontoRetifoz;

end;

procedure TFOrdemServicoCad.LeDescontoRetifoz;
var totDescValPecas, totDescValServico,
totValPecas, totValServico: Double;
begin

totValPecas := 0;
totValServico := 0;
totDescValPecas := 0;
totDescValServico := 0;

  DBGrid1.DataSource.DataSet.DisableControls;
  with DMOrdemServico do
  begin
    QSomaItemOS.Close;
    QSomaItemOS.SetVariable('COD_ORDEM_SERVICO_CAB', QOrdemServicoCOD_ORDEM_SERVICO_CAB.Value);
    QSomaItemOS.Open;

    totDescValServico := QSomaItemOSSVAL_TOTAL_DESC_SERVICOS.Value;
    totDescValPecas := QSomaItemOSSVAL_DESCONTO.Value - totDescValServico;

  end;
  MEDescPecasPerc.Text :=  '';
  MEDescServicosPerc.Text := '';
  MEDescPecas.Text := FormatFloat('##,###,##0.00',totDescValPecas);
  MEDescServicos.Text := FormatFloat('##,###,##0.00',totDescValServico);
  DBGrid1.DataSource.DataSet.EnableControls;

end;

procedure TFOrdemServicoCad.MEDescPecasPercExit(Sender: TObject);
begin
  inherited;
  try
    if Trim(MEDescPecasPerc.Text) <> '' then
      MEDescPecasPerc.Text := CurrToStrF(StrToCurr(Trim(MEDescPecasPerc.Text)),ffFixed,2);
  Except
    on E: Exception do
    begin
      ShowMessage('Não foi possível converter os valores, verifique a informação!');
      MEDescPecasPerc.SetFocus;
    end;
  end;
end;

procedure TFOrdemServicoCad.MEDescServicosPercExit(Sender: TObject);
begin
  inherited;
  try
    if Trim(MEDescServicosPerc.Text) <> '' then
      MEDescServicosPerc.Text := CurrToStrF(StrToCurr(Trim(MEDescServicosPerc.Text)),ffFixed,2);
  Except
    on E: Exception do
    begin
      ShowMessage('Não foi possível converter os valores, verifique a informação!');
      MEDescServicosPerc.SetFocus;
    end;
  end;
end;

procedure TFOrdemServicoCad.ValidaCamposNFeCadastro;
  var naoPreenchidos : string;
begin
   with DMCadastro do
   begin
     QCadastro.Close;
     QCadastro.SetVariable('PK',DMOrdemServico.QOrdemServicoCOD_CADASTRO.Value);
     QCadastro.Open;
     if(QCadastroNUM_CGC_CPF.Value = '') then
       naoPreenchidos := naoPreenchidos + #13 + 'CPF/CNPJ';
     if QCadastroIND_CONSUMIDOR_FINAL.IsNull then
       naoPreenchidos := naoPreenchidos + #13 + 'Consumidor Final';
     if(QCadastroDESC_ENDERECO.Value = '') then
       naoPreenchidos := naoPreenchidos + #13 + 'Endereço';
     if(QCadastroDESC_BAIRRO.Value = '') then
       naoPreenchidos := naoPreenchidos + #13 + 'Bairro';
     if(QCadastroDESC_CEP.Value = '') then
       naoPreenchidos := naoPreenchidos + #13 + 'CEP';
     if(QCadastroCOD_CIDADE.IsNull) then
       naoPreenchidos := naoPreenchidos + #13 + 'Cidade';
     if DMOracle.FastSelect('COD_CIDADE_IBGE', 'TB_CIDADE', 'COD_CIDADE = ' + QCadastroCOD_CIDADE.Text) = '' then
       naoPreenchidos := naoPreenchidos + #13 + 'Código do IBGE da Cidade ' + QCadastroDESC_CIDADE.Text;
     if(naoPreenchidos <> '') then
       begin
         ShowMessage('Os campos a seguir são obrigatórios para a emissão de NF-e: ' + naoPreenchidos);
         Abort;
       end;
  end;
end;


procedure TFOrdemServicoCad.DBPCidadePrestacaoDefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FCidadeCons;
  Classe := TFcidadeCons;
end;



procedure TFOrdemServicoCad.ReemitirNotaFiscal1Click(Sender: TObject);
begin
  inherited;
  with DMOrdemServico do
    begin
      if not QOrdemServico.Eof then
      begin
        QOrdemServicoNota.Close;
        QOrdemServicoNota.SetVariable('ORDEM_SERVICO', QOrdemServicoCOD_ORDEM_SERVICO_CAB.Value);
        QOrdemServicoNota.Open;

        QOrdemServicoNota.First;
        while not QOrdemServicoNota.Eof do
        begin
          if (not QOrdemServicoNotaDESC_CHAVE_ACESSO.IsNull) then
          begin
            DMNfe.SetaNfe(Bib.LimpaNumero(QOrdemServicoNotaDESC_CHAVE_ACESSO.Value), True);
            if StrToInt('0' + DMNfe.QNfeSIT_NFE.Value) in SIT_NFE_ACEITO then
            begin
              if FNfEletronicaLoteCons = nil then
                FNfEletronicaLoteCons := TFNfEletronicaLoteCons.Create(Application);
              FNfEletronicaLoteCons.CarregaNota(QOrdemServicoNotaCOD_NOTA_CAB.Value);
              FNfEletronicaLoteCons.Foco := nfDanfe;
              FNfEletronicaLoteCons.ShowModal;
            end;

          end;
          QOrdemServicoNota.Next;
        end;
      end;
    end;
end;

procedure TFOrdemServicoCad.ExportarNotaFiscal1Click(Sender: TObject);
begin
  inherited;
  with DMOrdemServico do
  begin
    if not QOrdemServico.Eof then
    begin
      QOrdemServicoNota.Close;
      QOrdemServicoNota.SetVariable('ORDEM_SERVICO', QOrdemServicoCOD_ORDEM_SERVICO_CAB.Value);
      QOrdemServicoNota.Open;

      QOrdemServicoNota.First;
      while not QOrdemServicoNota.Eof do
      begin
        if (not QOrdemServicoNotaDESC_CHAVE_ACESSO.IsNull) then
        begin
          DMNfe.SetaNfe(Bib.LimpaNumero(QOrdemServicoNotaDESC_CHAVE_ACESSO.Value), True);
          if StrToInt('0' + DMNfe.QNfeSIT_NFE.Value) in SIT_NFE_ACEITO then
          begin
            if FNfEletronicaLoteCons = nil then
              FNfEletronicaLoteCons := TFNfEletronicaLoteCons.Create(Application);
            FNfEletronicaLoteCons.CarregaNota(QOrdemServicoNotaCOD_NOTA_CAB.Value);
            FNfEletronicaLoteCons.Foco := nfExportar;
            FNfEletronicaLoteCons.ShowModal;
          end;

        end;
        QOrdemServicoNota.Next;
      end;
    end;
  end;
end;

procedure TFOrdemServicoCad.EnviarNotaFiscalporEmail1Click(
  Sender: TObject);
begin
  inherited;
  with DMOrdemServico do
  begin
    if not QOrdemServico.Eof then
    begin
      QOrdemServicoNota.Close;
      QOrdemServicoNota.SetVariable('ORDEM_SERVICO', QOrdemServicoCOD_ORDEM_SERVICO_CAB.Value);
      QOrdemServicoNota.Open;

      QOrdemServicoNota.First;
      while not QOrdemServicoNota.Eof do
      begin
        if (not QOrdemServicoNotaDESC_CHAVE_ACESSO.IsNull) then
        begin
          DMNfe.SetaNfe(Bib.LimpaNumero(QOrdemServicoNotaDESC_CHAVE_ACESSO.Value), True);
          if StrToInt('0' + DMNfe.QNfeSIT_NFE.Value) in SIT_NFE_ACEITO then
          begin
            if FNfEletronicaLoteCons = nil then
              FNfEletronicaLoteCons := TFNfEletronicaLoteCons.Create(Application);
            FNfEletronicaLoteCons.CarregaNota(QOrdemServicoNotaCOD_NOTA_CAB.Value);
            FNfEletronicaLoteCons.Foco := nfEmail;
            FNfEletronicaLoteCons.ShowModal;
          end;
        end;
        QOrdemServicoNota.Next;
      end;
    end;
  end;
end;

procedure TFOrdemServicoCad.DBPTabelaPrecoCodigoChange(Sender: TObject);
begin
  inherited;
  if DMOrdemServico.QOrdemServicoIt.State in [DsInsert, DsEdit] then
  begin
      wAlterouLista := true;
end;
end;

procedure TFOrdemServicoCad.DBPTabelaPrecoCodigoExit(Sender: TObject);
begin
  inherited;

if DMOrdemServico.QOrdemServico.State in [DsInsert, DsEdit] then
  begin
    if DMOrdemServico.QOrdemServicoItCOD_TABELA_PRECO_CAB.Value > 0 then
    begin

      // Não houve alteração
      if wAlterouLista = false then
        exit;
      if DMOrdemServico.QOrdemServicoItCOD_TABELA_PRECO_CAB.Value = wCodigoTabelaPreco then
        exit;

      if MessageDlg('Deseja utilizar esta lista em todos os itens do pedido?'
        , mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        DMOrdemServico.pUtilizaListaPrecoTodosItens := true;
        DMOrdemServico.pUtilizaListaPreco1Item := false;
      end
      else
      begin
        DMOrdemServico.pUtilizaListaPreco1Item := true;
        DMOrdemServico.pUtilizaListaPrecoTodosItens := false;
      end;
    end;

    if (DMOrdemServico.QOrdemServicoItCOD_TABELA_PRECO_CAB.Value > 0) and
    (DMOrdemServico.QOrdemServicoItCOD_PRODUTO.Value > 0) then
    begin
      DMOrdemServico.PrecoTabela;
    end
    else
      if DMOrdemServico.QOrdemServicoItCOD_PRODUTO.Value > 0 then
        DMOrdemServico.QOrdemServicoItCOD_PRODUTOValidate(nil);
    wAlterouLista := false;
  end;

end;

procedure TFOrdemServicoCad.DBPTabelaPrecoEnter(Sender: TObject);
begin
  inherited;
  wCodigoTabelaPreco := DMOrdemServico.QOrdemServicoItCOD_TABELA_PRECO_CAB.Value;
end;

procedure TFOrdemServicoCad.DBPTabelaPrecoDefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FTabelaPrecoCons;
  Classe := TFTabelaPrecoCons;
end;

procedure TFOrdemServicoCad.DBPanel8Exit(Sender: TObject);
begin
  inherited;
//Adicionado para que seja possível remover o veículo informado na O.S.  Alex 10/08/2022
  if ( (DMParamSistema.CodEmpresa = 'PATELI') or (DMParamSistema.CodEmpresa = 'ALFA') )and (DBPanel8.DBEdit.Text = '') then
  begin
    EdModelo.Clear;
    DBPanel8.DBEdit.Clear;
    MEPlaca.Clear;
    DMOrdemServico.QOrdemServicoCOD_VEICULO.Text := '';
  end;
end;

procedure TFOrdemServicoCad.ArquivarOS1Click(Sender: TObject);
begin
  inherited;
  if DMOrdemServico.QOrdemServicoDt_Saida.Value > 0 then
    raise Exception.Create('Ordem de Serviço já fechada');
  try
    DMOrdemServico.QOrdemServico.Edit;
    DMOrdemServico.QOrdemServicoIND_SITUACAO_OS.Value := 'ARQUIVADA';
    DMOrdemServico.QOrdemServico.Post;
    DMOracle.DBCemapa.Commit;
  except
    if DMOrdemServico.QOrdemServico.State in [dsEdit, dsInsert] then
      DMOrdemServico.QOrdemServico.Cancel; // RollBack
    raise;
  end;
end;

procedure TFOrdemServicoCad.DBPTecnicoCodigoExit(Sender: TObject);
begin
  inherited;
  if DMParamSistema.CodEmpresa = 'NFCE-IVO' then
    DMOrdemServico.QOrdemServicoCOD_VENDEDOR.Text := DMOrdemServico.QOrdemServicoCOD_TECNICO.Text;
end;

procedure TFOrdemServicoCad.GeraBoletoApi;
var
  wBoletoApi : IBoletoApi;
begin

    with DMNotaSaida, DMOrdemServico do
    begin

      QOrdemServicoNota.Close;
      QOrdemServicoNota.SetVariable('ORDEM_SERVICO', QOrdemServicoCOD_ORDEM_SERVICO_CAB.Value);
      QOrdemServicoNota.Open;

      QOrdemServicoNota.First;
      while not QOrdemServicoNota.Eof do
      begin

        QBoletoAPINota.Close;
        QBoletoAPINota.SetVariable('COD_NOTA_CAB', QOrdemServicoNotaCOD_NOTA_CAB.Value);
        QBoletoAPINota.Open;



        if (QBoletoAPINotaIND_API_BOLETO.Value = 'SIM') then
        begin
          QBoletoAPI.Close;
          QBoletoAPI.SetVariable('COD_NOTA', QOrdemServicoNotaCOD_NOTA_CAB.Value);

          wBoletoApi := TBoletoFactory.RetornaBoletoBanco(QOrdemServicoNotaCOD_FILIAL.Value,
                                               QOrdemServicoNotaNUM_NOTA.Value,
                                               QOrdemServicoNotaCOD_NOTA_CAB.Value,
                                               QBoletoAPINotaCOD_BANCO.Value,
                                               0,
                                               TGBNota,
                                               QBoletoAPINotaIND_AMBIENTE_API_BOLETO.Value,
                                               True, False);  // true fixo para enviar o e-mail do boleto. Se vazio no cadastro
                                                                   // mensagem informa que não tem e não envia. Pode ser feito
                                                                   // manual depois pelo vendas

          wBoletoApi.EnviarBoletosApi;
          if not wBoletoApi.GetIndTemRejeicao then
          begin
            if (MessageDlg('Deseja imprimir o(s) boleto(s)?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
              wBoletoApi.GerarPDF;
          end
          else if wBoletoApi.GetIndTemRejeicao then
            ShowMessage('Rejeições ao enviar os boletos. Verifique com o suporte!');
        end; // if QBoletoAPINota
        QOrdemServicoNota.Next;
      end;  //  while QOrdemServicoNota
    end; // with dmnotasaida, dmordemservico
end;

procedure TFOrdemServicoCad.ReenviarBoletos1Click(Sender: TObject);
begin
  inherited;

  with DMOrdemServico do
  begin

    if not QOrdemServico.Eof then
    begin
      QOrdemServicoNota.Close;
      QOrdemServicoNota.SetVariable('ORDEM_SERVICO', QOrdemServicoCOD_ORDEM_SERVICO_CAB.Value);
      QOrdemServicoNota.Open;

      QOrdemServicoNota.First;
      if not QOrdemServicoNota.Eof then
      begin
        GeraBoletoApi;
      end;
    end;
  end;
end;

procedure TFOrdemServicoCad.ImprimeBoletoApi;
var
  wBoletoApi : IBoletoApi;
begin

  with DMNotaSaida, DMOrdemServico do
  begin
  
    if not QOrdemServico.Eof then
    begin
      QOrdemServicoNota.Close;
      QOrdemServicoNota.SetVariable('ORDEM_SERVICO', QOrdemServicoCOD_ORDEM_SERVICO_CAB.Value);
      QOrdemServicoNota.Open;

      QOrdemServicoNota.First;
      while not QOrdemServicoNota.Eof do
      begin
        QBoletoAPINota.Close;
        QBoletoAPINota.SetVariable('COD_NOTA_CAB', QOrdemServicoNotaCOD_NOTA_CAB.Value);
        QBoletoAPINota.Open;


        if (QBoletoAPINotaIND_API_BOLETO.Value = 'SIM') then
        begin
          QBoletoAPI.Close;
          QBoletoAPI.SetVariable('COD_NOTA', QOrdemServicoNotaCOD_NOTA_CAB.Value);

          wBoletoApi := TBoletoFactory.RetornaBoletoBanco(QOrdemServicoNotaCOD_FILIAL.Value,
                                               QOrdemServicoNotaNUM_NOTA.Value,
                                               QOrdemServicoNotaCOD_NOTA_CAB.Value,
                                               QBoletoAPINotaCOD_BANCO.Value,
                                               0,
                                               TGBNota,
                                               QBoletoAPINotaIND_AMBIENTE_API_BOLETO.Value,
                                               False, False);
                                               
          wBoletoApi.ImprimirBoletosApi;
        end; // if QBoletoAPINotaIND_API_BOLETO
        QOrdemServicoNota.Next;
      end; // while QOrdemServicoNota
    end;  // if not QOrdemServico.EOF
  end; // with DMNotaSaida, DMOrdemServico
end;

procedure TFOrdemServicoCad.EnviarEmailBoletoApi;
var
  wBoletoApi : IBoletoApi;
begin

  with DMNotaSaida, DMOrdemServico do
  begin

    if not QOrdemServico.Eof then
    begin
      QOrdemServicoNota.Close;
      QOrdemServicoNota.SetVariable('ORDEM_SERVICO', QOrdemServicoCOD_ORDEM_SERVICO_CAB.Value);
      QOrdemServicoNota.Open;

      QOrdemServicoNota.First;
      while not QOrdemServicoNota.Eof do
      begin
        QBoletoAPINota.Close;
        QBoletoAPINota.SetVariable('COD_NOTA_CAB', QOrdemServicoNotaCOD_NOTA_CAB.Value);
        QBoletoAPINota.Open;


        if (QBoletoAPINotaIND_API_BOLETO.Value = 'SIM') then
        begin
          QBoletoAPI.Close;
          QBoletoAPI.SetVariable('COD_NOTA', QOrdemServicoNotaCOD_NOTA_CAB.Value);

          wBoletoApi := TBoletoFactory.RetornaBoletoBanco(QOrdemServicoNotaCOD_FILIAL.Value,
                                               QOrdemServicoNotaNUM_NOTA.Value,
                                               QOrdemServicoNotaCOD_NOTA_CAB.Value,
                                               QBoletoAPINotaCOD_BANCO.Value,
                                               0,
                                               TGBNota,
                                               QBoletoAPINotaIND_AMBIENTE_API_BOLETO.Value,
                                               True, False);
          wBoletoApi.EnviaEmailBoletosApi;
        end; // if QBoletoAPINotaIND_API_BOLETO
        QOrdemServicoNota.Next;
      end; // while QOrdemServicoNota
    end;  // if not QOrdemServico.EOF
  end; // with DMNotaSaida, DMOrdemServico
end;

procedure TFOrdemServicoCad.BoletosEMail1Click(Sender: TObject);
begin
  inherited;
  if not (TestaExisteNota) then
  begin
     EnviarEmailBoletoApi;
  end;
end;

procedure TFOrdemServicoCad.ImprimirBoletos1Click(Sender: TObject);
begin
  inherited;

  if not (TestaExisteNota) then
  begin
     ImprimeBoletoApi;
  end;

end;

function TFOrdemServicoCad.TestaExisteNota: boolean;
begin
  // Criei isso aqui pra não ficar testando a nota em todo lugar. Depois já
  // vai entrar na nota e e varrer o dataset
  with DMOrdemServico do
  begin
    QOrdemServicoNota.Close;
    QOrdemServicoNota.SetVariable('ORDEM_SERVICO', QOrdemServicoCOD_ORDEM_SERVICO_CAB.Value);
    QOrdemServicoNota.Open;

    QOrdemServicoNota.First;
    Result := QOrdemServicoNota.Eof;
  end;
end;

procedure TFOrdemServicoCad.AtivaDesativaAPI;
begin

  ImprimirBoletos1.Visible := False;
  ReenviarBoletos1.Visible := False;
  BoletosEMail1.Visible := False;
  with DMNotaSaida, DMOrdemServico do
  begin

    if not QOrdemServico.Eof then
    begin
      QOrdemServicoNota.Close;
      QOrdemServicoNota.SetVariable('ORDEM_SERVICO', QOrdemServicoCOD_ORDEM_SERVICO_CAB.Value);
      QOrdemServicoNota.Open;

      QOrdemServicoNota.First;
      if not QOrdemServicoNota.Eof then
      begin
        QBoletoAPINota.Close;
        QBoletoAPINota.SetVariable('COD_NOTA_CAB', QOrdemServicoNotaCOD_NOTA_CAB.Value);
        QBoletoAPINota.Open;

        if (QBoletoAPINotaIND_API_BOLETO.Value = 'SIM') then
        begin
          ImprimirBoletos1.Visible := True;
          ReenviarBoletos1.Visible := True;
          BoletosEMail1.Visible := True;
        end;
      end;  // if QOrdemServicoNota.Eof
    end;  // if not QOrdemServico.Eof
  end; // with DMNotaSaida, DMOrdemServico
end;

end.


