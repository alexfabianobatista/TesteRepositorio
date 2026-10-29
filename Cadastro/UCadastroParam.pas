unit UCadastroParam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTPARAMETRO, StdCtrls, ExtCtrls, Buttons, ComCtrls, Mask, DBCtrls, Spin,
  QRExport, UFmCidade, UFmCadastro, UFmTipoCadastro, UFmRegiao, UFmRamo,
  UFmVendedor, UFmEstado, UFmClassificacao, UFmMotivo, UFmFilial, UFmDatas;

type
  TFCadastroParam = class(TFTParametro)
    CB0Ordem: TComboBox;
    TSCliente: TTabSheet;
    Label5: TLabel;
    TSEncerrado: TTabSheet;
    Label10: TLabel;
    CB1Ordem: TComboBox;
    TSAniversariante: TTabSheet;
    TSMalaDireta: TTabSheet;
    ME4Mensagem: TMaskEdit;
    Label18: TLabel;
    TSPropriedade: TTabSheet;
    Label23: TLabel;
    CB2Ordem: TComboBox;
    Label32: TLabel;
    CB4Ordem: TComboBox;
    TabSheet1: TTabSheet;
    GroupBox1: TGroupBox;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    ME5Mes_I: TMaskEdit;
    ME5Dia_I: TMaskEdit;
    UD5MesI: TUpDown;
    UD5DiaI: TUpDown;
    ME5Mes_F: TMaskEdit;
    ME5Dia_F: TMaskEdit;
    UD5DiaF: TUpDown;
    UD5MesF: TUpDown;
    Label43: TLabel;
    CB5Ordem: TComboBox;
    TabSheet2: TTabSheet;
    Label52: TLabel;
    Cb6Ordem: TComboBox;
    TabSheet3: TTabSheet;
    Label57: TLabel;
    SE7NrCopias: TSpinEdit;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    Label65: TLabel;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    Label80: TLabel;
    CB9Ordem: TComboBox;
    TabSheet6: TTabSheet;
    Rg6Cancelado: TRadioGroup;
    Rg0Cancelado: TRadioGroup;
    TabSheet7: TTabSheet;
    CB11Ordem: TComboBox;
    GroupBox0Data: TGroupBox;
    ME0Data: TMaskEdit;
    GB9Cadastro: TGroupBox;
    ME9Data: TMaskEdit;
    TabSheet8: TTabSheet;
    Label96: TLabel;
    Cb12Ordem: TComboBox;
    GroupBox2: TGroupBox;
    Me12DtReferencia: TMaskEdit;
    Label97: TLabel;
    Label98: TLabel;
    Me3Data: TMaskEdit;
    TabSheet9: TTabSheet;
    TabSheet10: TTabSheet;
    Label102: TLabel;
    Me14Dias: TMaskEdit;
    Label103: TLabel;
    Me14Motivo: TMaskEdit;
    Bt14Motivo: TBitBtn;
    Ed14Motivo: TEdit;
    TabSheet11: TTabSheet;
    Label106: TLabel;
    Cb15Ordem: TComboBox;
    Rg15Cancelado: TRadioGroup;
    GroupBox3: TGroupBox;
    Me15Data: TMaskEdit;
    Label113: TLabel;
    SE7NrCopias2: TSpinEdit;
    TabSheet12: TTabSheet;
    Cb16Ordem: TComboBox;
    TabSheet13: TTabSheet;
    GroupBox4: TGroupBox;
    Me17Dt_Inicial: TMaskEdit;
    GroupBox5: TGroupBox;
    Me17Valor: TMaskEdit;
    ME0DataF: TMaskEdit;
    Label123: TLabel;
    TabSheet14: TTabSheet;
    ME18Valor: TMaskEdit;
    Label129: TLabel;
    TabSheet15: TTabSheet;
    Label188: TLabel;
    CB19TipoProduto: TComboBox;
    GroupBox19: TGroupBox;
    Label132: TLabel;
    Label133: TLabel;
    Me19DataI: TMaskEdit;
    Me19DataF: TMaskEdit;
    RG0TipoCadastro: TRadioGroup;
    TabSheet16: TTabSheet;
    CB20Ordem: TComboBox;
    Label140: TLabel;
    GroupBox6: TGroupBox;
    ME20DtReferencia: TMaskEdit;
    Rg10Cancelados: TRadioGroup;
    TabSheet17: TTabSheet;
    GroupBox7: TGroupBox;
    Label143: TLabel;
    Label144: TLabel;
    ME20Data_I: TMaskEdit;
    ME20Data_F: TMaskEdit;
    TabSheet18: TTabSheet;
    RG23Porta: TRadioGroup;
    GroupBox8: TGroupBox;
    Label146: TLabel;
    Label147: TLabel;
    Me23Data_I: TMaskEdit;
    Me23Data_F: TMaskEdit;
    Label148: TLabel;
    CMB23Quantidade: TComboBox;
    FmCadastro23: TFmCadastro;
    FmCidade23: TFmCidade;
    FmTipoCadastro1: TFmTipoCadastro;
    FmRegiao1: TFmRegiao;
    FmRamo1: TFmRamo;
    FmVendedor1: TFmVendedor;
    FmEstado1: TFmEstado;
    FmClassificacao1: TFmClassificacao;
    FmCidade1: TFmCidade;
    Fm2Vendedor1: TFmVendedor;
    FmTipoCadastro10: TFmTipoCadastro;
    FmRegiao10: TFmRegiao;
    FmRamo10: TFmRamo;
    FmVendedor10: TFmVendedor;
    FmEstado10: TFmEstado;
    FmClassificacao10: TFmClassificacao;
    FmTipoCadastro2: TFmTipoCadastro;
    FmRegiao2: TFmRegiao;
    FmRamo2: TFmRamo;
    FmVendedor2: TFmVendedor;
    FmEstado2: TFmEstado;
    FmMotivo2: TFmMotivo;
    FmTipoCadastro3: TFmTipoCadastro;
    FmRamo3: TFmRamo;
    FmEstado3: TFmEstado;
    FmClassificacao3: TFmClassificacao;
    FmCadastro4: TFmCadastro;
    FmTipoCadastro4: TFmTipoCadastro;
    FmRegiao4: TFmRegiao;
    FmRamo4: TFmRamo;
    FmEstado4: TFmEstado;
    FmClassificacao4: TFmClassificacao;
    FmVendedor4: TFmVendedor;
    FmCadastro5: TFmCadastro;
    FmTipoCadastro5: TFmTipoCadastro;
    FmRegiao5: TFmRegiao;
    FmRamo5: TFmRamo;
    FmEstado5: TFmEstado;
    FmTipoCadastro6: TFmTipoCadastro;
    FmRegiao6: TFmRegiao;
    FmRamo6: TFmRamo;
    FmEstado6: TFmEstado;
    Fm1Cadastro8: TFmCadastro;
    Fm2Cadastro8: TFmCadastro;
    FmTipoCadastro7: TFmTipoCadastro;
    FmRegiao7: TFmRegiao;
    FmRamo7: TFmRamo;
    FmEstado7: TFmEstado;
    FmClassificacao7: TFmClassificacao;
    FmTipoCadastro9: TFmTipoCadastro;
    FmRegiao9: TFmRegiao;
    FmRamo9: TFmRamo;
    FmVendedor9: TFmVendedor;
    FmEstado9: TFmEstado;
    FmClassificacao9: TFmClassificacao;
    FmCadastro9: TFmCadastro;
    FmCadastro11: TFmCadastro;
    FmVendedor11: TFmVendedor;
    FmTipoCadastro12: TFmTipoCadastro;
    FmRegiao12: TFmRegiao;
    FmRamo12: TFmRamo;
    FmVendedor12: TFmVendedor;
    FmEstado12: TFmEstado;
    FmClassificacao12: TFmClassificacao;
    Label1: TLabel;
    FmTipoCadastro13: TFmTipoCadastro;
    FmRegiao13: TFmRegiao;
    FmRamo13: TFmRamo;
    FmVendedor13: TFmVendedor;
    FmEstado13: TFmEstado;
    FmClassificacao13: TFmClassificacao;
    FmTipoCadastro14: TFmTipoCadastro;
    FmRamo14: TFmRamo;
    FmCadastro14: TFmCadastro;
    FmTipoCadastro16: TFmTipoCadastro;
    FmRegiao16: TFmRegiao;
    FmRamo16: TFmRamo;
    FmEstado16: TFmEstado;
    FmClassificacao16: TFmClassificacao;
    FmVendedor16: TFmVendedor;
    FmCidade16: TFmCidade;
    FmTipoCadastro18: TFmTipoCadastro;
    FmRegiao18: TFmRegiao;
    FmRamo18: TFmRamo;
    FmEstado18: TFmEstado;
    FmVendedor18: TFmVendedor;
    FmClassificacao18: TFmClassificacao;
    FmCadastro19: TFmCadastro;
    FmVendedor19: TFmVendedor;
    FmCidade19: TFmCidade;
    FmRegiao19: TFmRegiao;
    Fm1Vendedor20: TFmVendedor;
    Fm2Vendedor20: TFmVendedor;
    FmTipoCadastro20: TFmTipoCadastro;
    FmFilial18: TFmFilial;
    FmFilial20: TFmFilial;
    FmTipoCadastro21: TFmTipoCadastro;
    FmRegiao21: TFmRegiao;
    FmRegiao27 : TFmRegiao;
    FmRamo21: TFmRamo;
    FmVendedor21: TFmVendedor;
    FmEstado21: TFmEstado;
    FmClassificacao21: TFmClassificacao;
    FmCadastro22: TFmCadastro;
    FmFilial22: TFmFilial;
    GroupBox9: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    ME10Mes_I: TMaskEdit;
    ME10Dia_I: TMaskEdit;
    UpDown1: TUpDown;
    UpDown2: TUpDown;
    ME10Mes_F: TMaskEdit;
    ME10Dia_F: TMaskEdit;
    UpDown3: TUpDown;
    UpDown4: TUpDown;
    FmEstado17: TFmEstado;
    lblOrdem: TLabel;
    TabSheet19: TTabSheet;
    FmEstado23: TFmEstado;
    RG23TipoCadastro: TRadioGroup;
    GroupBox10: TGroupBox;
    Label11: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label9: TLabel;
    CB2DiaI: TComboBox;
    CB2MesI: TComboBox;
    CB2MesF: TComboBox;
    CB2DiaF: TComboBox;
    TabSheet20: TTabSheet;
    Rg9Nome: TRadioGroup;
    Rg0Fantasia: TRadioGroup;
    TabSheet21: TTabSheet;
    FmTipoCadastro25: TFmTipoCadastro;
    FmCadastro1: TFmCadastro;
    ME2Mensagem: TMemo;
    Me2Assunto: TMaskEdit;
    Label12: TLabel;
    Label17: TLabel;
    RG2TipoMensagem: TRadioGroup;
    Label24: TLabel;
    MeBairro: TMaskEdit;
    Label25: TLabel;
    Me10Bairro: TMaskEdit;
    FmCidade12: TFmCidade;
    Label26: TLabel;
    Me12Bairro: TMaskEdit;
    Me16Bairro: TMaskEdit;
    Label27: TLabel;
    FmFilial24: TFmFilial;
    RG0LiberaVenda: TRadioGroup;
    TabSheet22: TTabSheet;
    Fm26TipoCadastro: TFmTipoCadastro;
    Fm26Regiao: TFmRegiao;
    Fm26Ramo: TFmRamo;
    Fm26Vendedor: TFmVendedor;
    Fm26Estado: TFmEstado;
    Fm26Classificacao: TFmClassificacao;
    GroupBox11: TGroupBox;
    DTP26NascInicio: TDateTimePicker;
    Label28: TLabel;
    Label29: TLabel;
    DTP26NascFinal: TDateTimePicker;
    Fm26Cadastro: TFmCadastro;
    CB26ConsideraData: TCheckBox;
    FmCadastro24: TFmCadastro;
    GB12DataAgendamento: TGroupBox;
    Label13: TLabel;
    MeAgendamento24Ini: TMaskEdit;
    Label14: TLabel;
    MeAgendamento24Fin: TMaskEdit;
    FmCidade24: TFmCidade;
    RGAtrasado24: TRadioGroup;
    TSEtiquetaAssinante: TTabSheet;
    FmCidade27: TFmCidade;
    MeBairroEtiqueta27: TMaskEdit;
    Label15: TLabel;
    GroupBox12: TGroupBox;
    Label16: TLabel;
    Label30: TLabel;
    MEData27: TMaskEdit;
    MEDataF27: TMaskEdit;
    FmEntregador: TFmVendedor;
    RGListaAgendamento: TRadioGroup;
    FmDatasVctoAssinatura: TFmDatas;
    TabSheet23: TTabSheet;
    FmTipoCadastro8: TFmTipoCadastro;
    FmRegiao3: TFmRegiao;
    FmRamo8: TFmRamo;
    FmVendedor3: TFmVendedor;
    FmEstado8: TFmEstado;
    FmClassificacao2: TFmClassificacao;
    GroupBox13: TGroupBox;
    Me13DtReferencia: TMaskEdit;
    CB13Ordem: TComboBox;
    Label31: TLabel;
    RadioGroup1: TRadioGroup;
    Label33: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Me14MotivoExit(Sender: TObject);
    procedure Bt14MotivoClick(Sender: TObject);
    procedure UDMesIClick(Sender: TObject; Button: TUDBtnType);
    procedure RG2TipoMensagemClick(Sender: TObject);
    procedure CB26ConsideraDataClick(Sender: TObject);
    procedure FmCidade2BtCidadeClick(Sender: TObject);
    procedure FmCidade27BtCidadeClick(Sender: TObject);
    procedure FmRegiao27BtRegiaoClick(Sender: TObject);
    procedure UD5DiaIChanging(Sender: TObject; var AllowChange: Boolean);
    procedure UD5MesIChanging(Sender: TObject; var AllowChange: Boolean);
    procedure UD5DiaFChanging(Sender: TObject; var AllowChange: Boolean);
    procedure UD5MesFChanging(Sender: TObject; var AllowChange: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadastroParam: TFCadastroParam;

implementation

uses UTipoCadastro_cl, UTipoCadastroCons, URegiaoCons, URegiao_cl,
  URamoCons, URamo_cl, UEstadoCons, UEstado_cl, UMotivoCons, UMotivo_cl,
  UCadastro_cl, UCadastroCons, UClassCadastroCons, UClassCadastro_cl,
  UVendedorCons, UVendedor_cl, UOracle_cl, UFilialCons, UFilial_cl,
  UCidade_cl, UCidadeCons, UParamSistema_cl, UUsuario_cl, UBiblioteca;

{$R *.DFM}

procedure TFCadastroParam.FormActivate(Sender: TObject);
begin
  inherited;
  DMTipoCadastro.QTipoCadastroAll.Open;
end;

procedure TFCadastroParam.FormCreate(Sender: TObject);
Var wNumAno, wNumMes, wNumDia : Word;
    wDataIni, wDataFin: TDate;
begin
  inherited;
  DecodeDate(Date,wNumAno,wNumMes,wNumDia);
  CB2DiaI.ItemIndex := 0;
  CB2DiaF.ItemIndex := 30;
  CB2MesI.ItemIndex := wNumMes - 1;
  CB2MesF.ItemIndex := wNumMes - 1;
  UD5MesI.Position := wNumMes;
  UD5MesF.Position := wNumMes;
  UD5DiaI.Position := 1;
  UD5DiaF.Position := 30;
  Cb0Ordem.ItemIndex := 0;
  Cb1Ordem.ItemIndex := 0;
  Cb2Ordem.ItemIndex := 0;
  Cb4Ordem.ItemIndex := 0;
  Cb5Ordem.ItemIndex := 0;
  Cb6Ordem.ItemIndex := 0;
  Cb9Ordem.ItemIndex := 0;
  Cb11Ordem.ItemIndex := 0;
  Cb12Ordem.ItemIndex := 0;
//  Rg0Cancelado.ItemIndex := 0;
  Rg6Cancelado.ItemIndex := 0;
  If (DMParamSistema.QParamSistemaCod_Empresa.Value = 'ABATE') And
     (DMUsuario.pTipoFuncionario = 'VENDEDOR') Then
  Begin
     FmVendedor1.MeVendedor.Text := IntToStr(DMUsuario.CodVendedorPadrao);
     FmVendedor2.MeVendedor.Text := IntToStr(DMUsuario.CodVendedorPadrao);
     FmVendedor10.MeVendedor.Text := IntToStr(DMUsuario.CodVendedorPadrao);
     FmVendedor12.MeVendedor.Text := IntToStr(DMUsuario.CodVendedorPadrao);
     FmVendedor1.MeVendedor.Enabled := False;
     FmVendedor1.BtVendedor.Enabled := False;
     FmVendedor2.MeVendedor.Enabled := False;
     FmVendedor2.BtVendedor.Enabled := False;
     FmVendedor10.MeVendedor.Enabled := False;
     FmVendedor10.BtVendedor.Enabled := False;
     FmVendedor12.MeVendedor.Enabled := False;
     FmVendedor12.BtVendedor.Enabled := False;

  End;

  Bib.PriUltDataVar(wDataIni, wDataFin, True);
  if DMParamSistema.CodEmpresa = 'JORNAL' then
    FmDatasVctoAssinatura.Visible := True;
{  MeSaidaIni24.Text := FormatDateTime('dd/mm/yyyy', wDataIni);
  MeSaidaFin24.Text := FormatDateTime('dd/mm/yyyy', wDataFin);
  MeEntradaIni24.Text := FormatDateTime('dd/mm/yyyy', wDataIni);
  MeEntradaFin24.Text := FormatDateTime('dd/mm/yyyy', wDataFin);}
end;

procedure TFCadastroParam.Me14MotivoExit(Sender: TObject);
begin
  inherited;
  Ed14Motivo.Text := DMOracle.BuscaParametro('DESC_MOTIVO','TB_MOTIVO','COD_MOTIVO',Me14Motivo.text,'');
end;

procedure TFCadastroParam.Bt14MotivoClick(Sender: TObject);
begin
  inherited;
  If FMotivoCons = Nil then
    FMotivoCons := TFMotivoCons.Create(Application);
  If FMotivoCons.ShowModal = mrOk then
  Begin
    Me14Motivo.Text := DMMotivo.QMotivoConsCod_Motivo.Text;
    Me14MotivoExit(Self);
  End;
end;

procedure TFCadastroParam.UDMesIClick(Sender: TObject; Button: TUDBtnType);
begin
  inherited;
//  ShowMessage(IntToStr(TUpDown(Sender).Position));
//  if Button = btNext then
//    ShowMessage('Next')
//  else if Button = btPrev then
//    ShowMessage('Prev');
  if Assigned(TUpDown(Sender).Associate) then
    ShowMessage(TUpDown(Sender).Associate.Name);
end;

procedure TFCadastroParam.RG2TipoMensagemClick(Sender: TObject);
begin
  inherited;
  if RG2TipoMensagem.ItemIndex = 1 then
  begin
    Me2Assunto.Color := clWindow;
    ME2Mensagem.Color := clWindow;
  end
  else
  begin
    Me2Assunto.Color := clBtnFace;
    ME2Mensagem.Color := clBtnFace;
  end;
  Me2Assunto.Enabled := RG2TipoMensagem.ItemIndex = 1;
  ME2Mensagem.Enabled := RG2TipoMensagem.ItemIndex = 1;
end;

procedure TFCadastroParam.CB26ConsideraDataClick(Sender: TObject);
begin
  inherited;
  DTP26NascInicio.Enabled := CB26ConsideraData.Checked;
  DTP26NascFinal.Enabled := CB26ConsideraData.Checked;
end;

procedure TFCadastroParam.FmCidade2BtCidadeClick(Sender: TObject);
begin
  inherited;
  FmCidade27.BtCidadeClick(Sender);

end;

procedure TFCadastroParam.FmCidade27BtCidadeClick(Sender: TObject);
begin
  inherited;
  FmCidade27.BtCidadeClick(Sender);

end;

procedure TFCadastroParam.FmRegiao27BtRegiaoClick(Sender: TObject);
begin
  inherited;
  FmRegiao27.BtRegiaoClick(Sender);

end;

procedure TFCadastroParam.UD5DiaIChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  inherited;
  ME5Dia_I.Text := IntToStr(UD5DiaI.Position);
end;

procedure TFCadastroParam.UD5MesIChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  inherited;
  ME5Mes_I.Text := InttoStr(UD5MesI.Position);
end;

procedure TFCadastroParam.UD5DiaFChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  inherited;
  ME5Dia_F.Text := IntToStr(UD5DiaF.Position);
end;

procedure TFCadastroParam.UD5MesFChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  inherited;
  ME5Mes_F.Text := IntToStr(UD5MesF.Position);
end;

end.

