unit UGrupoFiscalParam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTPARAMETRO, StdCtrls, ExtCtrls, Buttons, ComCtrls, Mask,
  UFmFilial, UFmCadastro;

type
  TFGrupoFiscalParam = class(TFTParametro)
    TabSheet1: TTabSheet;
    GroupBox1: TGroupBox;
    ME1NatOperacao_I: TMaskEdit;
    ME1NatOperacao_F: TMaskEdit;
    Label1: TLabel;
    TabSheet2: TTabSheet;
    GroupBox2: TGroupBox;
    ME2DtInicial: TMaskEdit;
    ME2DtFinal: TMaskEdit;
    Label2: TLabel;
    Label3: TLabel;
    SDlgGrupoFiscal: TSaveDialog;
    GroupBox3: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    ME1Data_I: TMaskEdit;
    ME1Data_F: TMaskEdit;
    FmFilial2: TFmFilial;
    FmFilial1: TFmFilial;
    TabSheet3: TTabSheet;
    FmFilial3: TFmFilial;
    GroupBox4: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Me3Data_I: TMaskEdit;
    Me3Data_F: TMaskEdit;
    FmCadastro1: TFmCadastro;
    Label122: TLabel;
    MeOperacao9: TMaskEdit;
    BtOperacoes3: TBitBtn;
    Label8: TLabel;
    Label9: TLabel;
    ME823: TMaskEdit;
    ME921: TMaskEdit;
    TabSheet4: TTabSheet;
    FmFilial4: TFmFilial;
    FmCadastro2: TFmCadastro;
    Label10: TLabel;
    MeOperacao4: TMaskEdit;
    BtOperacoes4: TBitBtn;
    GroupBox5: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    ME4DtInicial: TMaskEdit;
    ME4DtFinal: TMaskEdit;
    Rg9TipoDocumento: TRadioGroup;
    procedure BtOperacoes3Click(Sender: TObject);
    procedure BtOperacoes4Click(Sender: TObject);
    procedure FmCadastro2BtCadastroClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FGrupoFiscalParam: TFGrupoFiscalParam;

implementation

uses UOperacaoCons, UOperacao_cl;

{$R *.dfm}

procedure TFGrupoFiscalParam.BtOperacoes3Click(Sender: TObject);
begin
  inherited;
  if FOperacaoCons = Nil then
    FOperacaoCons := TFOperacaoCons.Create(Application);
  if FOperacaoCons.ShowModal = MrOk then
  begin
    if Trim(MeOperacao9.Text) = '' then
      MeOperacao9.Text := DMOperacao.QOperacaoConsCOD_OPERACAO.Text
    else
      MeOperacao9.Text := MeOperacao9.Text + ',' + DMOperacao.QOperacaoConsCOD_OPERACAO.Text;
  end;
end;

procedure TFGrupoFiscalParam.BtOperacoes4Click(Sender: TObject);
begin
  inherited;
  if FOperacaoCons = Nil then
    FOperacaoCons := TFOperacaoCons.Create(Application);
  if FOperacaoCons.ShowModal = MrOk then
  begin
    if Trim(MeOperacao4.Text) = '' then
      MeOperacao4.Text := DMOperacao.QOperacaoConsCOD_OPERACAO.Text
    else
      MeOperacao4.Text := MeOperacao4.Text + ',' + DMOperacao.QOperacaoConsCOD_OPERACAO.Text;
  end;
end;

procedure TFGrupoFiscalParam.FmCadastro2BtCadastroClick(Sender: TObject);
begin
  inherited;
  FmCadastro2.BtCadastroClick(Sender);

end;

end.
