unit UPlanoContasParam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTPARAMETRO, ComCtrls, StdCtrls, ExtCtrls, Buttons, Mask, UFmFilial;

type
  TFPlanoContasParam = class(TFTParametro)
    TabSheet1: TTabSheet;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    ME0CodFilialInicial: TMaskEdit;
    ME0CodFilialFinal: TMaskEdit;
    ME0CodContaInicial: TMaskEdit;
    ME0CodContaFinal: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ME0FilialInicial: TMaskEdit;
    ME0FilialFinal: TMaskEdit;
    ME0ContaInicial: TMaskEdit;
    ME0ContaFinal: TMaskEdit;
    Bt0CodFilialInicial: TBitBtn;
    Bt0CodFilialFinal: TBitBtn;
    BitBtn4: TBitBtn;
    TabSheet2: TTabSheet;
    GroupBox3: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    ME1CodFilialInicial: TMaskEdit;
    ME1CodFilialFinal: TMaskEdit;
    ME1FilialInicial: TMaskEdit;
    ME1FilialFinal: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    GroupBox4: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    ME1CodContaInicial: TMaskEdit;
    ME1CodContaFinal: TMaskEdit;
    ME1ContaInicial: TMaskEdit;
    ME1ContaFinal: TMaskEdit;
    BitBtn3: TBitBtn;
    BT: TBitBtn;
    aa: TBitBtn;
    Me1Pagina: TMaskEdit;
    Label27: TLabel;
    Rg1Grau: TRadioGroup;
    Rg1Situacao: TRadioGroup;
    TabSheet3: TTabSheet;
    Fm2Filial: TFmFilial;
    Me2Periodo: TMaskEdit;
    Label9: TLabel;
    Label10: TLabel;
    MEPag: TMaskEdit;
    procedure Bt0CodFilialInicialClick(Sender: TObject);
    procedure Bt0CodFilialFinalClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure ME0CodFilialInicialChange(Sender: TObject);
    procedure ME0CodFilialFinalChange(Sender: TObject);
    procedure ME1CodFilialInicialChange(Sender: TObject);
    procedure ME1CodFilialFinalChange(Sender: TObject);
    procedure BTClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure aaClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure ME0CodContaInicialChange(Sender: TObject);
    procedure ME0CodContaFinalChange(Sender: TObject);
    procedure ME1CodContaInicialChange(Sender: TObject);
    procedure ME1CodContaFinalChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPlanoContasParam: TFPlanoContasParam;

implementation

uses UFilialCons, UFilial_cl, UOracle_cl, UPlanoContaCons, UPlanoConta_cl,
     UBiblioteca, UParamSistema_cl;

{$R *.DFM}

procedure TFPlanoContasParam.Bt0CodFilialInicialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
    ME0CodFilialInicial.Text:=FloatToStr(DMFilial.QFilialConsCod_Filial.Value);
end;

procedure TFPlanoContasParam.Bt0CodFilialFinalClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
    ME0CodFilialFinal.Text:=FloatToStr(DMFilial.QFilialConsCod_Filial.Value);
end;

procedure TFPlanoContasParam.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
    ME1CodFilialInicial.Text:=FloatToStr(DMFilial.QFilialConsCod_Filial.Value);
end;

procedure TFPlanoContasParam.BitBtn2Click(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
    ME1CodFilialFinal.Text:=FloatToStr(DMFilial.QFilialConsCod_Filial.Value);
end;

procedure TFPlanoContasParam.ME0CodFilialInicialChange(Sender: TObject);
begin
  inherited;
  if Trim(ME0CodFilialInicial.Text) <> '' then
    ME0FilialInicial.text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME0CodFilialInicial.Text)
  else
    ME0FilialInicial.text:='Todos';
end;

procedure TFPlanoContasParam.ME0CodFilialFinalChange(Sender: TObject);
begin
  inherited;
  if Trim(ME0CodFilialFinal.Text) <> '' then
    ME0FilialFinal.text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME0CodFilialFinal.Text)
  else
    ME0FilialFinal.text:='Todos';
end;

procedure TFPlanoContasParam.ME1CodFilialInicialChange(Sender: TObject);
begin
  inherited;
  if Trim(ME1CodFilialInicial.Text) <> '' then
    ME1FilialInicial.text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME1CodFilialInicial.Text)
  else
    ME1FilialInicial.text:='Todos';
end;

procedure TFPlanoContasParam.ME1CodFilialFinalChange(Sender: TObject);
begin
  inherited;
  if Trim(ME1CodFilialFinal.Text) <> '' then
    ME1FilialFinal.text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME1CodFilialFinal.Text)
  else
    ME1FilialFinal.text:='Todos';
end;

procedure TFPlanoContasParam.BTClick(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons=Nil then
    FPlanoContaCons:=TFPlanoContaCons.Create(Application);
  DMPlanoConta.QPlanoContaCons.Close;
  if FPlanoContaCons.ShowModal=mrOk then
    ME0CodContaInicial.Text:=DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;
  DMPlanoConta.QPlanoContaCons.Close;
end;

procedure TFPlanoContasParam.BitBtn4Click(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons=Nil then
    FPlanoContaCons:=TFPlanoContaCons.Create(Application);
  DMPlanoConta.QPlanoContaCons.Close;
  if FPlanoContaCons.ShowModal=mrOk then
    ME0CodContaFinal.Text:=DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;
  DMPlanoConta.QPlanoContaCons.Close;
end;

procedure TFPlanoContasParam.aaClick(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons=Nil then
    FPlanoContaCons:=TFPlanoContaCons.Create(Application);
  DMPlanoConta.QPlanoContaCons.Close;
  if FPlanoContaCons.ShowModal=mrOk then
    ME1CodContaInicial.Text:=DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;
  DMPlanoConta.QPlanoContaCons.Close;
end;

procedure TFPlanoContasParam.BitBtn3Click(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons=Nil then
    FPlanoContaCons:=TFPlanoContaCons.Create(Application);
  DMPlanoConta.QPlanoContaCons.Close;
  if FPlanoContaCons.ShowModal=mrOk then
    ME1CodContaFinal.Text:=DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;
  DMPlanoConta.QPlanoContaCons.Close;
end;

procedure TFPlanoContasParam.ME0CodContaInicialChange(Sender: TObject);
begin
  inherited;
  if ((Trim(Bib.LimpaString(ME0CodContaInicial.Text,'.'))) <> '') then
    ME0ContaInicial.Text:=DMOracle.BuscaNome('SELECT DESC_PLANO_CONTA FROM TB_PLANO_CONTA','NUM_PLANO_CONTA = '+Bib.LimpaString(ME0CodContaInicial.Text,'.'))
  else
    ME0ContaInicial.Clear;
end;

procedure TFPlanoContasParam.ME0CodContaFinalChange(Sender: TObject);
begin
  inherited;
  if ((Trim(Bib.LimpaString(ME0CodContaFinal.Text,'.'))) <> '') then
    ME0ContaFinal.Text:=DMOracle.BuscaNome('SELECT DESC_PLANO_CONTA FROM TB_PLANO_CONTA','NUM_PLANO_CONTA = '+Bib.LimpaString(ME0CodContaFinal.Text,'.'))
  else
    ME0ContaFinal.Clear;
end;

procedure TFPlanoContasParam.ME1CodContaInicialChange(Sender: TObject);
begin
  inherited;
  if ((Trim(Bib.LimpaString(ME1CodContaInicial.Text,'.'))) <> '') then
    ME1ContaInicial.Text:=DMOracle.BuscaNome('SELECT DESC_PLANO_CONTA FROM TB_PLANO_CONTA','NUM_PLANO_CONTA = '+Bib.LimpaString(ME1CodContaInicial.Text,'.'))
  else
    ME1ContaInicial.Clear;
end;

procedure TFPlanoContasParam.ME1CodContaFinalChange(Sender: TObject);
begin
  inherited;
  If ((Trim(Bib.LimpaString(ME1CodContaFinal.Text,'.'))) <> '') then
    ME1ContaFinal.Text:=DMOracle.BuscaNome('SELECT DESC_PLANO_CONTA FROM TB_PLANO_CONTA','NUM_PLANO_CONTA = '+Bib.LimpaString(ME1CodContaFinal.Text,'.'))
  else
    ME1ContaFinal.Clear;
end;

procedure TFPlanoContasParam.FormActivate(Sender: TObject);
begin
  inherited;
  Case Round(DMParamSistema.QParamSistemaNum_Graus_Contabil.Value) Of
     4: Begin
          ME1CodContaInicial.EditMask := '#.##.##.######;0;';
          ME1CodContaFinal.EditMask := '#.##.##.######;0;';
        End;
     5: Begin
          ME1CodContaInicial.EditMask := '#.##.##.##.######;0;';
          ME1CodContaFinal.EditMask := '#.##.##.##.######;0;';
        End;
     6: Begin
          ME1CodContaInicial.EditMask := '#.##.##.##.##.######;0;';
          ME1CodContaFinal.EditMask := '#.##.##.##.##.######;0;';
        End;
  End;
End;

End.
