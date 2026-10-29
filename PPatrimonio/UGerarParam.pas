unit UGerarParam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTPARAMETRO, ComCtrls, StdCtrls, ExtCtrls, Buttons, Mask;

type
  TFGerarParam = class(TFTParametro)
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    ME0Ano: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    CB0Mes: TComboBox;
    Label3: TLabel;
    CB1Mes: TComboBox;
    ME1Ano: TMaskEdit;
    Label4: TLabel;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    Label5: TLabel;
    CB2Mes: TComboBox;
    Label6: TLabel;
    ME2Ano: TMaskEdit;
    Label7: TLabel;
    CB3Mes: TComboBox;
    Label8: TLabel;
    ME3Ano: TMaskEdit;
    TabSheet5: TTabSheet;
    RG4Motivo: TRadioGroup;
    TabSheet6: TTabSheet;
    Label17: TLabel;
    ME5CodFilial: TMaskEdit;
    SB5Filial: TSpeedButton;
    ME5Filial: TMaskEdit;
    ME5NotaSaida: TMaskEdit;
    SB5NotaSaida: TSpeedButton;
    Label9: TLabel;
    Label10: TLabel;
    ME5NotaEntrada: TMaskEdit;
    SB5NotaEntrada: TSpeedButton;
    Label11: TLabel;
    ME5CodResponsavel: TMaskEdit;
    SpeedButton1: TSpeedButton;
    ME5Responsavel: TMaskEdit;
    Label12: TLabel;
    ME5CodLocalizacao: TMaskEdit;
    SpeedButton2: TSpeedButton;
    ME5Localizacao: TMaskEdit;
    Label13: TLabel;
    ME5CodBemPrincipal: TMaskEdit;
    SB5BemPrincipal: TSpeedButton;
    ME5BemPrincipal: TMaskEdit;
    TabSheet7: TTabSheet;
    ME6CodGrupoConta: TMaskEdit;
    ME6GrupoConta: TMaskEdit;
    SB6GrupoConta: TSpeedButton;
    Label14: TLabel;
    Label15: TLabel;
    ME0CodFilial: TMaskEdit;
    ME0Filial: TMaskEdit;
    SB0Filial: TSpeedButton;
    Label16: TLabel;
    ME1CodFilial: TMaskEdit;
    SB1Filial: TSpeedButton;
    ME1Filial: TMaskEdit;
    Label18: TLabel;
    ME2CodFilial: TMaskEdit;
    SB2Filial: TSpeedButton;
    ME2Filial: TMaskEdit;
    Label19: TLabel;
    ME3CodFilial: TMaskEdit;
    ME3Filial: TMaskEdit;
    SB3Filial: TSpeedButton;
    ME4DtBaixa: TMaskEdit;
    Label20: TLabel;
    Label21: TLabel;
    ME5DtTransferencia: TMaskEdit;
    ME4ValBaixa: TMaskEdit;
    Label22: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure SB5FilialClick(Sender: TObject);
    procedure ME5CodFilialExit(Sender: TObject);
    procedure ME5CodResponsavelExit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure ME5CodLocalizacaoExit(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SB5NotaEntradaClick(Sender: TObject);
    procedure SB5NotaSaidaClick(Sender: TObject);
    procedure ME5CodBemPrincipalExit(Sender: TObject);
    procedure SB5BemPrincipalClick(Sender: TObject);
    procedure SB6GrupoContaClick(Sender: TObject);
    procedure ME6CodGrupoContaExit(Sender: TObject);
    procedure ME0CodFilialExit(Sender: TObject);
    procedure SB0FilialClick(Sender: TObject);
    procedure ME1CodFilialExit(Sender: TObject);
    procedure SB1FilialClick(Sender: TObject);
    procedure ME2CodFilialExit(Sender: TObject);
    procedure SB2FilialClick(Sender: TObject);
    procedure ME3CodFilialExit(Sender: TObject);
    procedure SB3FilialClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FGerarParam: TFGerarParam;

implementation

uses UFilialCons, UFilial_cl, UOracle_cl, UUsuarioCons, UUsuario_cl,
  ULocalizacaoCons, ULocalizacao_cl, UNotaEntradaCons, UNotaSaidaCons,
  UNotaEntrada_cl, UNotaSaida_cl, UPatrimonioCons, UPatrimonio_cl,
  UGrupoContaCons, UGrupoConta_cl;

{$R *.DFM}

procedure TFGerarParam.FormCreate(Sender: TObject);
var
  Ano, Mes, Dia : word;
begin
  inherited;

  DecodeDate (Date, Ano, Mes, Dia);
  CB0Mes.ItemIndex := Mes - 1;
  ME0Ano.Text := inttostr(ano);
  CB1Mes.ItemIndex := Mes - 1;
  ME1Ano.Text := inttostr(ano);
  CB2Mes.ItemIndex := Mes - 1;
  ME2Ano.Text := inttostr(ano);
  CB3Mes.ItemIndex := Mes - 1;
  ME3Ano.Text := inttostr(ano);
end;

procedure TFGerarParam.SB5FilialClick(Sender: TObject);
begin
  inherited;
  If (FFilialCons = nil) Then
    FFilialCons := TFFilialCons.Create(Application);
  If (FFilialCons.ShowModal = mrOk) Then
    ME5CodFilial.Text := DMFilial.QFilialConsCOD_FILIAL.Text;
  ME5CodFilialExit(self);
end;

procedure TFGerarParam.ME5CodFilialExit(Sender: TObject);
begin
  inherited;
  If(Trim(ME5CodFilial.Text) <> '')Then
    ME5Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = ' + Trim(ME5CodFilial.Text))
  Else
    ME5Filial.Text := '';
end;

procedure TFGerarParam.ME5CodResponsavelExit(Sender: TObject);
begin
  inherited;
  If(Trim(ME5CodResponsavel.Text) <> '')Then
    ME5Responsavel.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_USUARIO','COD_USUARIO = ' + Trim(ME5CodResponsavel.Text))
  Else
    ME5Responsavel.Text := '';
end;

procedure TFGerarParam.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  If (FUsuarioCons = nil) Then
    FUsuarioCons := TFUsuarioCons.Create(Application);
  If (FUsuarioCons.ShowModal = mrOk) Then
    ME5CodResponsavel.Text := DMUsuario.QUsuarioConsCOD_USUARIO.Text;
  ME5CodResponsavelExit(self);
end;

procedure TFGerarParam.ME5CodLocalizacaoExit(Sender: TObject);
begin
  inherited;
  If(Trim(ME5CodLocalizacao.Text) <> '')Then
    ME5Localizacao.Text := DMOracle.BuscaNome('SELECT DESC_LOCALIZACAO FROM TB_LOCALIZACAO','COD_LOCALIZACAO = ' + Trim(ME5CodLocalizacao.Text))
  Else
    ME5Localizacao.Text := '';
end;

procedure TFGerarParam.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  If (FLocalizacaoCons = nil) Then
    FLocalizacaoCons := TFLocalizacaoCons.Create(Application);
  If (FLocalizacaoCons.ShowModal = mrOk) Then
    ME5CodLocalizacao.Text := DMLocalizacao.QLocalizacaoConsCOD_LOCALIZACAO.Text;
  ME5CodLocalizacaoExit(self);
end;

procedure TFGerarParam.SB5NotaEntradaClick(Sender: TObject);
begin
  inherited;
  If(FNotaEntradaCons = nil)Then
    FNotaEntradaCons := TFNotaEntradaCons.Create(Application);
  If(FNotaEntradaCons.showmodal = mrOk)Then
    ME5NotaEntrada.Text := DMNotaEntrada.QNotaEntradaConsCOD_NOTA_CAB.Text;
end;

procedure TFGerarParam.SB5NotaSaidaClick(Sender: TObject);
begin
  inherited;
  If(FNotaSaidaCons = nil)Then
    FNotaSaidaCons := TFNotaSaidaCons.Create(Application);
  If(FNotaSaidaCons.showmodal = mrOk)Then
    ME5NotaSaida.Text := DMNotaSaida.QNotaSaidaConsCOD_NOTA_CAB.Text;
end;

procedure TFGerarParam.ME5CodBemPrincipalExit(Sender: TObject);
begin
  inherited;
  If(Trim(ME5CodBemPrincipal.Text) <> '')Then
    ME5BemPrincipal.Text := DMOracle.BuscaNome('SELECT DESC_PATRIMONIO FROM TB_PATRIMONIO_CAB','COD_PATRIMONIO_CAB = ' + Trim(ME5CodBemPrincipal.Text))
  Else
    ME5BemPrincipal.Text := '';
end;

procedure TFGerarParam.SB5BemPrincipalClick(Sender: TObject);
begin
  inherited;
  If (FPatrimonioCons = nil) Then
    FPatrimonioCons := TFPatrimonioCons.Create(Application);
  If (FPatrimonioCons.ShowModal = mrOk) Then
    ME5CodBemPrincipal.Text := DMPatrimonio.QPatrimonioConsCOD_PATRIMONIO_CAB.Text;
  ME5CodBemPrincipalExit(self);
end;

procedure TFGerarParam.SB6GrupoContaClick(Sender: TObject);
begin
  inherited;
  If (FGrupoContaCons = nil) Then
    FGrupoContaCons := TFGrupoContaCons.Create(Application);
  If (FGrupoContaCons.ShowModal = mrOk) Then
    ME6CodGrupoConta.Text := DMGrupoConta.QGrupoContaConsCOD_PATRIMONIO_GRUPO_CONTA.Text;
  ME6CodGrupoContaExit(self);
end;

procedure TFGerarParam.ME6CodGrupoContaExit(Sender: TObject);
begin
  inherited;
  If(Trim(ME6CodGrupoConta.Text) <> '')Then
    ME6GrupoConta.Text := DMOracle.BuscaNome('SELECT DESC_PATRIMONIO_GRUPO_CONTA FROM TB_PATRIMONIO_GRUPO_CONTA','COD_PATRIMONIO_GRUPO_CONTA = ' + Trim(ME6CodGrupoConta.Text))
  Else
    ME6GrupoConta.Text := '';
end;

procedure TFGerarParam.ME0CodFilialExit(Sender: TObject);
begin
  inherited;
  If(Trim(ME0CodFilial.Text) <> '')Then
    ME0Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = ' + Trim(ME0CodFilial.Text))
  Else
    ME0Filial.Text := 'Todas';
end;

procedure TFGerarParam.SB0FilialClick(Sender: TObject);
begin
  inherited;
  If (FFilialCons = nil) Then
    FFilialCons := TFFilialCons.Create(Application);
  If (FFilialCons.ShowModal = mrOk) Then
    ME0CodFilial.Text := DMFilial.QFilialConsCOD_FILIAL.Text;
  ME0CodFilialExit(self);
end;

procedure TFGerarParam.ME1CodFilialExit(Sender: TObject);
begin
  inherited;
  If(Trim(ME1CodFilial.Text) <> '')Then
    ME1Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = ' + Trim(ME1CodFilial.Text))
  Else
    ME1Filial.Text := '';
end;

procedure TFGerarParam.SB1FilialClick(Sender: TObject);
begin
  inherited;
  If (FFilialCons = nil) Then
    FFilialCons := TFFilialCons.Create(Application);
  If (FFilialCons.ShowModal = mrOk) Then
    ME0CodFilial.Text := DMFilial.QFilialConsCOD_FILIAL.Text;
  ME0CodFilialExit(self);
end;

procedure TFGerarParam.ME2CodFilialExit(Sender: TObject);
begin
  inherited;
  If(Trim(ME2CodFilial.Text) <> '')Then
    ME2Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = ' + Trim(ME2CodFilial.Text))
  Else
    ME2Filial.Text := '';
end;

procedure TFGerarParam.SB2FilialClick(Sender: TObject);
begin
  inherited;
  If (FFilialCons = nil) Then
    FFilialCons := TFFilialCons.Create(Application);
  If (FFilialCons.ShowModal = mrOk) Then
    ME2CodFilial.Text := DMFilial.QFilialConsCOD_FILIAL.Text;
  ME2CodFilialExit(self);
end;

procedure TFGerarParam.ME3CodFilialExit(Sender: TObject);
begin
  inherited;
  If(Trim(ME3CodFilial.Text) <> '')Then
    ME3Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = ' + Trim(ME3CodFilial.Text))
  Else
    ME3Filial.Text := '';
end;

procedure TFGerarParam.SB3FilialClick(Sender: TObject);
begin
  inherited;
  If (FFilialCons = nil) Then
    FFilialCons := TFFilialCons.Create(Application);
  If (FFilialCons.ShowModal = mrOk) Then
    ME3CodFilial.Text := DMFilial.QFilialConsCOD_FILIAL.Text;
  ME3CodFilialExit(self);
end;

end.
