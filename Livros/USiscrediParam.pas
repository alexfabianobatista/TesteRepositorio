unit USiscrediParam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTPARAMETRO, StdCtrls, ExtCtrls, Buttons, ComCtrls, Mask;

type
  TFSiscrediParam = class(TFTParametro)
    TabSheet1: TTabSheet;
    GroupBox15: TGroupBox;
    Label73: TLabel;
    Label74: TLabel;
    ME0DtInicial: TMaskEdit;
    Me0DtFinal: TMaskEdit;
    Label1: TLabel;
    Sb0Operacao: TSpeedButton;
    Me0Operacao: TMaskEdit;
    LB0Operacoes: TListBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Rg0Tipo: TRadioGroup;
    SDlgAMagnetico: TSaveDialog;
    Label2: TLabel;
    Sb0Tributacao: TSpeedButton;
    Me0Tributacao: TMaskEdit;
    Lb0Tributacao: TListBox;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Label72: TLabel;
    SB0Filial: TSpeedButton;
    Me0Filial: TMaskEdit;
    Ed0Filial: TEdit;
    Label3: TLabel;
    Sb0Estado: TSpeedButton;
    Me0Estado: TMaskEdit;
    Ed0Estado: TEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Me0FilialExit(Sender: TObject);
    procedure Sb0OperacaoClick(Sender: TObject);
    procedure SB0FilialClick(Sender: TObject);
    procedure Sb0TributacaoClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure Me0EstadoExit(Sender: TObject);
    procedure Sb0EstadoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSiscrediParam: TFSiscrediParam;

implementation

uses UFilial_cl, UFilialCons,UOracle_cl, UOperacaoCons, UOperacao_cl,
  UTributacaoCons, UTributacao_cl, UEstadoCons, UEstado_cl;

{$R *.DFM}

procedure TFSiscrediParam.BitBtn1Click(Sender: TObject);
begin
  inherited;
  LB0Operacoes.Items.Add(Me0Operacao.Text);
  Me0Operacao.SetFocus;
end;

procedure TFSiscrediParam.BitBtn2Click(Sender: TObject);
begin
  inherited;
  LB0Operacoes.Items.Delete(LB0Operacoes.ItemIndex);
  Me0Operacao.SetFocus;
end;

procedure TFSiscrediParam.Me0FilialExit(Sender: TObject);
begin
  inherited;
  If Trim(Me0Filial.Text) <> '' Then
    Ed0Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL', 'COD_FILIAL = ' + Trim(Me0Filial.Text))
  Else
    Ed0Filial.Text := 'Todas';

end;

procedure TFSiscrediParam.Sb0OperacaoClick(Sender: TObject);
begin
  inherited;
  If FOperacaoCons = Nil then
    FOperacaoCons := TFOperacaoCons.Create(Application);
  FOperacaoCons.RGTipoOperacao.ItemIndex := 1;
  If FOperacaoCons.ShowModal = mrOk then
    Me0Operacao.Text := DMOperacao.QOperacaoConsCod_Operacao.Text;

end;

procedure TFSiscrediParam.SB0FilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
    Me0Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
  Me0FilialExit(Self);

end;

procedure TFSiscrediParam.Sb0TributacaoClick(Sender: TObject);
begin
  inherited;
  If FTributacaoCons = Nil then
    FTributacaoCons := TFTributacaoCons.Create(Application);
  If FTributacaoCons.ShowModal = mrOk then
    Me0Tributacao.Text := DMTributacao.QTributacaoConsCod_Tributacao.Text;
end;

procedure TFSiscrediParam.BitBtn3Click(Sender: TObject);
begin
  inherited;
  LB0Tributacao.Items.Add(Me0Tributacao.Text);
  Me0Tributacao.SetFocus;

end;

procedure TFSiscrediParam.BitBtn4Click(Sender: TObject);
begin
  inherited;
  LB0Tributacao.Items.Delete(LB0Tributacao.ItemIndex);
  Me0tributacao.SetFocus;

end;

procedure TFSiscrediParam.Me0EstadoExit(Sender: TObject);
begin
  inherited;
  If Trim(Me0Estado.Text) <> '' Then
    Ed0Estado.Text := DMOracle.BuscaNome('SELECT DESC_ESTADO FROM TB_ESTADO', 'COD_ESTADO = ' + Chr(39) + Trim(Me0Estado.Text) + Chr(39))
  Else
    Ed0Estado.Text := 'Todas';

end;

procedure TFSiscrediParam.Sb0EstadoClick(Sender: TObject);
begin
  inherited;
  If FEstadoCons = Nil then
    FEstadoCons := TFEstadoCons.Create(Application);
  If FEstadoCons.ShowModal = mrOk then
    Me0Estado.Text := DMEstado.QEstadoConsCod_Estado.Text;
  Me0EstadoExit(Self);

end;

end.
