unit UContabilParam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTPARAMETRO, StdCtrls, ExtCtrls, Buttons, ComCtrls, Mask, QuickRpt;

type
  TFContabilParam = class(TFTParametro)
    TabSheet1: TTabSheet;
    ME0CodFilial: TMaskEdit;
    Bt0Filial: TBitBtn;
    ME0Filial: TMaskEdit;
    GroupBox1: TGroupBox;
    ME0PeriodoInicial: TMaskEdit;
    Label1: TLabel;
    ME0PeriodoFinal: TMaskEdit;
    Label2: TLabel;
    GroupBox2: TGroupBox;
    ME0DtInicial: TMaskEdit;
    ME0DtFinal: TMaskEdit;
    Label3: TLabel;
    Label4: TLabel;
    GroupBox3: TGroupBox;
    ME0ContaInicial: TMaskEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    ME0DescContaFinal: TMaskEdit;
    ME0DescContaInicial: TMaskEdit;
    ME0ContaFinal: TMaskEdit;
    TabSheet2: TTabSheet;
    ME1CodFilial: TMaskEdit;
    ME1Filial: TMaskEdit;
    Bt1Filial: TBitBtn;
    ME1ContaInicial: TMaskEdit;
    ME1ContaFinal: TMaskEdit;
    RG1UltimoGrau: TRadioGroup;
    ME1DescContaInicial: TMaskEdit;
    ME1DescContaFinal: TMaskEdit;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Label8: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    RG1Tipo: TRadioGroup;
    TabSheet3: TTabSheet;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    ME2CodFilialInicial: TMaskEdit;
    ME2FilialInicial: TMaskEdit;
    BitBtn1: TBitBtn;
    ME2PeriodoInicial: TMaskEdit;
    ME2ContaInicial: TMaskEdit;
    ME2ContaFinal: TMaskEdit;
    ME2DescContaInicial: TMaskEdit;
    ME2DescContaFinal: TMaskEdit;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    ME2PeriodoFinal: TMaskEdit;
    Label16: TLabel;
    Label17: TLabel;
    ME2CodFilialFinal: TMaskEdit;
    ME2FilialFinal: TMaskEdit;
    BitBtn8: TBitBtn;
    TabSheet4: TTabSheet;
    ME3CodFilial: TMaskEdit;
    ME3Periodo: TMaskEdit;
    ME3Filial: TMaskEdit;
    BitBtn9: TBitBtn;
    Label18: TLabel;
    Label19: TLabel;
    TabSheet5: TTabSheet;
    Label20: TLabel;
    Me4CodFilial: TMaskEdit;
    BitBtn10: TBitBtn;
    Me4Filial: TMaskEdit;
    GroupBox7: TGroupBox;
    Label33: TLabel;
    Label34: TLabel;
    ME4Inicial: TMaskEdit;
    ME4Final: TMaskEdit;
    Rg4Tipo: TRadioGroup;
    GroupBox4: TGroupBox;
    Label21: TLabel;
    Label22: TLabel;
    Me1PeriodoInicial: TMaskEdit;
    Me1PeriodoFinal: TMaskEdit;
    GroupBox5: TGroupBox;
    Label9: TLabel;
    Label23: TLabel;
    Me2DtInicial: TMaskEdit;
    Me2DtFinal: TMaskEdit;
    Label24: TLabel;
    Me0Pagina: TMaskEdit;
    Label25: TLabel;
    Me1Pagina: TMaskEdit;
    Label26: TLabel;
    Me2Pagina: TMaskEdit;
    Label27: TLabel;
    Me3Pagina: TMaskEdit;
    Label28: TLabel;
    Me3Grau: TMaskEdit;
    TabSheet6: TTabSheet;
    CB5Mes: TComboBox;
    CB5Ano: TComboBox;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    ME5CodFilial: TMaskEdit;
    BitBtn11: TBitBtn;
    ME5DescFilial: TMaskEdit;
    TabSheet7: TTabSheet;
    Label32: TLabel;
    ME6CodFilial: TMaskEdit;
    BitBtn12: TBitBtn;
    ME6DescFilial: TMaskEdit;
    GroupBox6: TGroupBox;
    CB6Mes_3: TComboBox;
    CB6Mes_2: TComboBox;
    CB6Mes_1: TComboBox;
    CB6Ano_1: TComboBox;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    CB6Mes_4: TComboBox;
    CB6Mes_5: TComboBox;
    CB6Mes_6: TComboBox;
    CB6Ano_4: TComboBox;
    Label38: TLabel;
    CB6Ano_2: TComboBox;
    CB6Ano_3: TComboBox;
    CB6Ano_5: TComboBox;
    CB6Ano_6: TComboBox;
    ME6Grau: TMaskEdit;
    Label39: TLabel;
    TabSheet8: TTabSheet;
    Label40: TLabel;
    ME7Filial: TMaskEdit;
    BitBtn7Filial: TBitBtn;
    Ed7Filial: TEdit;
    ME7Ano: TMaskEdit;
    Label41: TLabel;
    TabSheet9: TTabSheet;
    Label42: TLabel;
    ME8Filial: TMaskEdit;
    BT8Filial: TBitBtn;
    Ed8Filial: TEdit;
    GroupBox8: TGroupBox;
    Label43: TLabel;
    Label44: TLabel;
    CB8Mes: TComboBox;
    CB8Ano: TComboBox;
    TabSheet10: TTabSheet;
    Label45: TLabel;
    ME9Filial: TMaskEdit;
    Bt9Filial: TBitBtn;
    Ed9Filial: TEdit;
    Label46: TLabel;
    ME9Cadastro: TMaskEdit;
    Bt9Cadastro: TBitBtn;
    Ed9Cadastro: TEdit;
    GroupBox9: TGroupBox;
    Label47: TLabel;
    Label48: TLabel;
    ME9Data_I: TMaskEdit;
    ME9Data_F: TMaskEdit;
    TabSheet11: TTabSheet;
    ME10Filial: TMaskEdit;
    SB10Filial: TSpeedButton;
    Ed10Filial: TEdit;
    GroupBox10: TGroupBox;
    ME10DtInicial: TMaskEdit;
    ME10DtFinal: TMaskEdit;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    GroupBox11: TGroupBox;
    ME10ContaInicial: TMaskEdit;
    Label52: TLabel;
    SB10ContaInicial: TSpeedButton;
    Ed10ContaInicial: TEdit;
    Label53: TLabel;
    MeTitular: TMaskEdit;
    Label54: TLabel;
    MeContador: TMaskEdit;
    Label55: TLabel;
    MeFuncao: TMaskEdit;
    Label56: TLabel;
    MeCrc: TMaskEdit;
    Label57: TLabel;
    Me1CodFilialFinal: TMaskEdit;
    ME1FilialFinal: TMaskEdit;
    Bt1FilialFinal: TBitBtn;
    Label58: TLabel;
    Me3CodFilialFinal: TMaskEdit;
    Me3FilialFinal: TMaskEdit;
    Bt3FilialFinal: TBitBtn;
    Label59: TLabel;
    ME0CodFilial1: TMaskEdit;
    Bt0Filial1: TBitBtn;
    Ed0Filial1: TMaskEdit;
    Rg1SaldoAnterior: TRadioGroup;
    Rg3SaldoAnterior: TRadioGroup;
    procedure FormActivate(Sender: TObject);
    procedure Bt0FilialClick(Sender: TObject);
    procedure ME0CodFilialChange(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Bt1FilialClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure ME1CodFilialChange(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure ME2CodFilialInicialChange(Sender: TObject);
    procedure ME2CodFilialFinalChange(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure ME3CodFilialChange(Sender: TObject);
    procedure ME0ContaInicialExit(Sender: TObject);
    procedure ME0ContaFinalExit(Sender: TObject);
    procedure ME1ContaInicialExit(Sender: TObject);
    procedure ME1ContaFinalExit(Sender: TObject);
    procedure ME2ContaInicialExit(Sender: TObject);
    procedure ME2ContaFinalExit(Sender: TObject);
    procedure Me4CodFilialChange(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure Me1PeriodoInicialExit(Sender: TObject);
    procedure ME0PeriodoInicialExit(Sender: TObject);
    procedure ME2PeriodoInicialExit(Sender: TObject);
    procedure ME2CodFilialInicialExit(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure ME5CodFilialChange(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure ME6CodFilialExit(Sender: TObject);
    procedure BitBtn7FilialClick(Sender: TObject);
    procedure ME7FilialExit(Sender: TObject);
    procedure ME8FilialExit(Sender: TObject);
    procedure BT8FilialClick(Sender: TObject);
    procedure ME9FilialExit(Sender: TObject);
    procedure Bt9FilialClick(Sender: TObject);
    procedure ME9CadastroExit(Sender: TObject);
    procedure Bt9CadastroClick(Sender: TObject);
    procedure SB10FilialClick(Sender: TObject);
    procedure ME10FilialExit(Sender: TObject);
    procedure SB10ContaInicialClick(Sender: TObject);
    procedure ME10ContaInicialExit(Sender: TObject);
    procedure Me1CodFilialFinalChange(Sender: TObject);
    procedure Bt1FilialFinalClick(Sender: TObject);
    procedure Me3CodFilialFinalChange(Sender: TObject);
    procedure Bt3FilialFinalClick(Sender: TObject);
    procedure Bt0Filial1Click(Sender: TObject);
    procedure ME0CodFilial1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FContabilParam: TFContabilParam;

implementation

uses UPlanoConta_cl, UParamSistema_cl, UFilialCons, UFilial_cl, UOracle_cl,
  UPlanoContaCons, UUsuario_cl, UCadastroCons, UCadastro_cl,
  URBalancoPatrimonial, URNotaExplicativa;

{$R *.DFM}

procedure TFContabilParam.FormActivate(Sender: TObject);
begin
  inherited;
  With DMPlanoConta do
  Begin
    QPlanoConta.Open;
    Case Round(DMParamSistema.QParamSistemaNum_Graus_Contabil.Value) Of
       4:begin
         ME0ContaInicial.EditMask := '#.##.##.######;0;';
         ME0ContaFinal.EditMask := '#.##.##.######;0;';
         ME1ContaInicial.EditMask := '#.##.##.######;0;';
         ME1ContaFinal.EditMask := '#.##.##.######;0;';
         ME2ContaInicial.EditMask := '#.##.##.######;0;';
         ME2ContaFinal.EditMask := '#.##.##.######;0;';
         ME10ContaInicial.EditMask := '#.##.##.######;0;';
         end;
       5:begin
         ME0ContaInicial.EditMask := '#.##.##.##.######;0;';
         ME0ContaFinal.EditMask := '#.##.##.##.######;0;';
         ME1ContaInicial.EditMask := '#.##.##.##.######;0;';
         ME1ContaFinal.EditMask := '#.##.##.##.######;0;';
         ME2ContaInicial.EditMask := '#.##.##.##.######;0;';
         ME2ContaFinal.EditMask := '#.##.##.##.######;0;';
         ME10ContaInicial.EditMask := '#.##.##.##.######;0;';
         end;
       6:begin
         ME0ContaInicial.EditMask := '#.##.##.##.##.######;0;';
         ME0ContaFinal.EditMask := '#.##.##.##.##.######;0;';
         ME1ContaInicial.EditMask := '#.##.##.##.##.######;0;';
         ME1ContaFinal.EditMask := '#.##.##.##.##.######;0;';
         ME2ContaInicial.EditMask := '#.##.##.##.##.######;0;';
         ME2ContaFinal.EditMask := '#.##.##.##.##.######;0;';
         ME10ContaInicial.EditMask := '#.##.##.##.##.######;0';
         end;
    End;
{    If DMParamSistema.QParamSistemaIND_TIPO_PLANO_CONTA.Value='UNICO' then
      begin
        ME0CodFilial.Text:='1';
        ME0CodFilial.Enabled:=False;
        Bt0Filial.Enabled:=False;
        ME1CodFilial.Text:='1';
        ME1CodFilial.Enabled:=False;
        Bt1Filial.Enabled:=False;
      end;
      ME0CodFilial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
      ME1CodFilial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
      ME3CodFilial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
      Me4CodFilial.Text:=FloatToStr(DMUsuario.CodFilialUsuario); }
  End;
end;

procedure TFContabilParam.Bt0FilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons=Nil then
    FFilialCons:=TFFilialCons.Create(Application);
  if FFilialCons.ShowModal=MrOk then
    begin
      ME0CodFilial.Text:=FloatToStr(DMFilial.QFilialConsCod_Filial.Value);
    end;
end;

procedure TFContabilParam.ME0CodFilialChange(Sender: TObject);
begin
  inherited;
  if Trim(ME0CodFilial.Text)<>'' then
    ME0Filial.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME0CodFilial.Text)
  else
    ME0Filial.Text:='Todas';
  Me0CodFilial1.Text := ME0CodFilial.Text;
end;

procedure TFContabilParam.BitBtn2Click(Sender: TObject);
begin
  inherited;
  if FPlanoContaCons=Nil then
    FPlanoContaCons:=TFPlanoContaCons.Create(Application);
  DMPlanoConta.QPlanoContaCons.Close;
  if FPlanoContaCons.ShowModal=mrOk then
  Begin
    ME0ContaInicial.Text:=DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;
    ME0DescContaInicial.Text:=DMPlanoConta.QPlanoContaConsDesc_Plano_Conta.Value;
  End;
  DMPlanoConta.QPlanoContaCons.Close;

end;

procedure TFContabilParam.BitBtn3Click(Sender: TObject);
begin
  inherited;
  if FPlanoContaCons=Nil then
    FPlanoContaCons:=TFPlanoContaCons.Create(Application);
  DMPlanoConta.QPlanoContaCons.Close;
  if FPlanoContaCons.ShowModal=mrOk then
  Begin
    ME0ContaFinal.Text:=DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;
    ME0DescContaFinal.Text:=DMPlanoConta.QPlanoContaConsDesc_Plano_Conta.Value;
  End;
  DMPlanoConta.QPlanoContaCons.Close;
end;

procedure TFContabilParam.Bt1FilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons=Nil then
    FFilialCons:=TFFilialCons.Create(Application);
  if FFilialCons.ShowModal=MrOk then
    begin
      ME1CodFilial.Text:=FloatToStr(DMFilial.QFilialConsCod_Filial.Value);
    end;
end;

procedure TFContabilParam.BitBtn4Click(Sender: TObject);
begin
  inherited;
  if FPlanoContaCons=Nil then
    FPlanoContaCons:=TFPlanoContaCons.Create(Application);
  DMPlanoConta.QPlanoContaCons.Close;
  if FPlanoContaCons.ShowModal=mrOk then
  Begin
    ME1ContaInicial.Text:=DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;
    ME1DescContaInicial.Text:=DMPlanoConta.QPlanoContaConsDesc_Plano_Conta.Value;
  End;
  DMPlanoConta.QPlanoContaCons.Close;
end;

procedure TFContabilParam.BitBtn5Click(Sender: TObject);
begin
  inherited;
  if FPlanoContaCons=Nil then
    FPlanoContaCons:=TFPlanoContaCons.Create(Application);
  DMPlanoConta.QPlanoContaCons.Close;
  If FPlanoContaCons.ShowModal=mrOk then
  Begin
    ME1ContaFinal.Text:=DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;
    ME1DescContaFinal.Text:=DMPlanoConta.QPlanoContaConsDesc_Plano_Conta.Value;
  End;
  DMPlanoConta.QPlanoContaCons.Close;
end;

procedure TFContabilParam.ME1CodFilialChange(Sender: TObject);
begin
  inherited;
  if Trim(ME1CodFilial.Text)<>'' then
    ME1Filial.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME1CodFilial.Text)
  else
    ME1Filial.Text:='Todas';
end;

procedure TFContabilParam.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if FFilialCons=Nil then
    FFilialCons:=TFFilialCons.Create(Application);
  if FFilialCons.ShowModal=MrOk then
    begin
      ME2CodFilialInicial.Text:=FloatToStr(DMFilial.QFilialConsCod_Filial.Value);
    end;
end;

procedure TFContabilParam.BitBtn8Click(Sender: TObject);
begin
  inherited;
  if FFilialCons=Nil then
    FFilialCons:=TFFilialCons.Create(Application);
  if FFilialCons.ShowModal=MrOk then
    begin
      ME2CodFilialFinal.Text:=FloatToStr(DMFilial.QFilialConsCod_Filial.Value);
    end;
end;

procedure TFContabilParam.ME2CodFilialInicialChange(Sender: TObject);
begin
  inherited;
  if Trim(ME2CodFilialInicial.Text)<>'' then
    ME2FilialInicial.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME2CodFilialInicial.Text)
  else
    ME2FilialInicial.text:='Todas';
end;

procedure TFContabilParam.ME2CodFilialFinalChange(Sender: TObject);
begin
  inherited;
  if Trim(ME2CodFilialFinal.Text)<>'' then
    ME2FilialFinal.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME2CodFilialFinal.Text)
  else
    ME2FilialFinal.text:='Todas';
end;

procedure TFContabilParam.BitBtn6Click(Sender: TObject);
begin
  inherited;
  if FPlanoContaCons=Nil then
    FPlanoContaCons:=TFPlanoContaCons.Create(Application);
  DMPlanoConta.QPlanoContaCons.Close;
  if FPlanoContaCons.ShowModal=mrOk then
  Begin
    ME2ContaInicial.Text:=DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;
    ME2DescContaInicial.Text:=DMPlanoConta.QPlanoContaConsDesc_Plano_Conta.Value;
  End;
  DMPlanoConta.QPlanoContaCons.Close;
end;

procedure TFContabilParam.BitBtn7Click(Sender: TObject);
begin
  inherited;
  if FPlanoContaCons=Nil then
    FPlanoContaCons:=TFPlanoContaCons.Create(Application);
  DMPlanoConta.QPlanoContaCons.Close;
  If FPlanoContaCons.ShowModal=mrOk then
  Begin
    ME2ContaFinal.Text:=DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;
    ME2DescContaFinal.Text:=DMPlanoConta.QPlanoContaConsDesc_Plano_Conta.Value;
  End;
  DMPlanoConta.QPlanoContaCons.Close;
end;

procedure TFContabilParam.BitBtn9Click(Sender: TObject);
begin
  inherited;
  if FFilialCons=Nil then
    FFilialCons:=TFFilialCons.Create(Application);
  if FFilialCons.ShowModal=MrOk then
    begin
      ME3CodFilial.Text:=FloatToStr(DMFilial.QFilialConsCod_Filial.Value);
    end;
end;

procedure TFContabilParam.ME3CodFilialChange(Sender: TObject);
begin
  inherited;
  if Trim(ME3CodFilial.Text)<>'' then
    ME3Filial.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME3CodFilial.Text)
  else
    ME3Filial.Text:='Todas';
end;

procedure TFContabilParam.ME0ContaInicialExit(Sender: TObject);
begin
  inherited;
  If trim(ME0CodFilial.Text)='' then
    begin
      if Trim(ME0ContaInicial.Text)<>'' then
        ME0DescContaInicial.Text:=DMOracle.BuscaNome('SELECT DESC_PLANO_CONTA FROM TB_PLANO_CONTA','NUM_PLANO_CONTA = '+chr(39)+ME0ContaInicial.Text+chr(39))
      else
        ME0DescContaInicial.Clear;
      ME0ContaFinal.Text := ME0ContaInicial.Text;
    end
  else
    begin
      if Trim(ME0ContaInicial.Text)<>'' then
        ME0DescContaInicial.Text:=DMOracle.BuscaNome('SELECT DESC_PLANO_CONTA FROM TB_PLANO_CONTA','NUM_PLANO_CONTA = '+chr(39)+ME0ContaInicial.Text+chr(39))
      else
        ME0DescContaInicial.Clear;
      ME0ContaFinal.Text := ME0ContaInicial.Text;
    end;
end;

procedure TFContabilParam.ME0ContaFinalExit(Sender: TObject);
begin
  inherited;
  If trim(ME0CodFilial.Text)='' then
    begin
      if Trim(ME0ContaFinal.Text)<>'' then
        ME0DescContaFinal.Text:=DMOracle.BuscaNome('SELECT DESC_PLANO_CONTA FROM TB_PLANO_CONTA','NUM_PLANO_CONTA = '+chr(39)+ME0ContaFinal.Text+chr(39))
      else
        ME0DescContaFinal.Clear;
    end
  else
    begin
      if Trim(ME0ContaFinal.Text)<>'' then
        ME0DescContaFinal.Text:=DMOracle.BuscaNome('SELECT DESC_PLANO_CONTA FROM TB_PLANO_CONTA','NUM_PLANO_CONTA = '+chr(39)+ME0ContaFinal.Text+chr(39))
      else
        ME0DescContaFinal.Clear;
    end;
end;

procedure TFContabilParam.ME1ContaInicialExit(Sender: TObject);
begin
  inherited;
  If trim(ME1CodFilial.Text)='' then
    begin
      if Trim(ME1ContaInicial.Text)<>'' then
        ME1DescContaInicial.Text:=DMOracle.BuscaNome('SELECT DESC_PLANO_CONTA FROM TB_PLANO_CONTA','NUM_PLANO_CONTA = '+chr(39)+ME1ContaInicial.Text+chr(39))
      else
        ME1DescContaInicial.Clear;
      ME1ContaFinal.Text := ME1ContaInicial.Text;
    end
  else
    begin
      if Trim(ME1ContaInicial.Text)<>'' then
        ME1DescContaInicial.Text:=DMOracle.BuscaNome('SELECT DESC_PLANO_CONTA FROM TB_PLANO_CONTA','NUM_PLANO_CONTA = '+chr(39)+ME1ContaInicial.Text+chr(39))
      else
        ME1DescContaInicial.Clear;
      ME1ContaFinal.Text := ME1ContaInicial.Text;
    end;
end;

procedure TFContabilParam.ME1ContaFinalExit(Sender: TObject);
begin
  inherited;
  If trim(ME1CodFilial.Text)='' then
    begin
      if Trim(ME1ContaFinal.Text)<>'' then
        ME1DescContaFinal.Text:=DMOracle.BuscaNome('SELECT DESC_PLANO_CONTA FROM TB_PLANO_CONTA','NUM_PLANO_CONTA = '+chr(39)+ME1ContaFinal.Text+chr(39))
      else
        ME1DescContaFinal.Clear;
    end
  else
    begin
      if Trim(ME1ContaFinal.Text)<>'' then
        ME1DescContaFinal.Text:=DMOracle.BuscaNome('SELECT DESC_PLANO_CONTA FROM TB_PLANO_CONTA','NUM_PLANO_CONTA = '+chr(39)+ME1ContaFinal.Text+chr(39))
      else
        ME1DescContaFinal.Clear;
    end;
end;

procedure TFContabilParam.ME2ContaInicialExit(Sender: TObject);
begin
  inherited;
//  if Trim(ME2CodFilial.text)='' then
//    begin
      if Trim(ME2ContaInicial.Text)<>'' then
        ME2DescContaInicial.Text:=DMOracle.BuscaNome('SELECT DESC_PLANO_CONTA FROM TB_PLANO_CONTA','NUM_PLANO_CONTA = '+chr(39)+ME2ContaInicial.Text+chr(39))
      else
        ME2DescContaInicial.Text:='Todos';
      Me2ContaFinal.Text := Me2ContaInicial.Text
//    end
//  else
//    begin
//      if Trim(ME2ContaInicial.Text)<>'' then
//        ME2DescContaInicial.Text:=DMOracle.BuscaNome('SELECT DESC_PLANO_CONTA FROM TB_PLANO_CONTA','NUM_PLANO_CONTA = '+ME2ContaInicial.Text+' AND COD_FILIAL = '+ME2CodFilial.text)
//      else
//        ME2DescContaInicial.Text:='Todos';
//    end;
end;

procedure TFContabilParam.ME2ContaFinalExit(Sender: TObject);
begin
  inherited;
//  if Trim(ME2CodFilial.text)='' then
//    begin
      if Trim(ME2ContaFinal.Text)<>'' then
        ME2DescContaFinal.Text:=DMOracle.BuscaNome('SELECT DESC_PLANO_CONTA FROM TB_PLANO_CONTA','NUM_PLANO_CONTA = '+chr(39)+ME2ContaFinal.Text+chr(39))
      else
        ME2DescContaFinal.Text:='Todos';
//    end
//  else
//    begin
//     if Trim(ME2ContaFinal.Text)<>'' then
//        ME2DescContaFinal.Text:=DMOracle.BuscaNome('SELECT DESC_PLANO_CONTA FROM TB_PLANO_CONTA','NUM_PLANO_CONTA = '+ME2ContaFinal.Text+' AND COD_FILIAL = '+ME2CodFilial.text)
//      else
//        ME2DescContaFinal.Text:='Todos';
//    end;
end;

procedure TFContabilParam.Me4CodFilialChange(Sender: TObject);
begin
  inherited;
  if Trim(ME4CodFilial.Text)<>'' then
    ME4Filial.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME4CodFilial.Text)
  else
    Me4Filial.Text := 'Todas';
end;

procedure TFContabilParam.BitBtn10Click(Sender: TObject);
begin
  inherited;
  if FFilialCons=Nil then
    FFilialCons:=TFFilialCons.Create(Application);
  if FFilialCons.ShowModal=MrOk then
    begin
      ME4CodFilial.Text:=FloatToStr(DMFilial.QFilialConsCod_Filial.Value);
    end;

end;

procedure TFContabilParam.Me1PeriodoInicialExit(Sender: TObject);
begin
  inherited;
  Me1PeriodoFinal.Text := Me1PeriodoInicial.Text;
end;

procedure TFContabilParam.ME0PeriodoInicialExit(Sender: TObject);
begin
  inherited;
  Me0PeriodoFinal.Text := Me0PeriodoInicial.Text;
end;

procedure TFContabilParam.ME2PeriodoInicialExit(Sender: TObject);
begin
  inherited;
  ME2PeriodoFinal.Text := ME2PeriodoInicial.Text;

end;

procedure TFContabilParam.ME2CodFilialInicialExit(Sender: TObject);
begin
  inherited;
  ME2CodFilialFinal.Text := ME2CodFilialInicial.Text;
end;

procedure TFContabilParam.BitBtn11Click(Sender: TObject);
begin
  inherited;
  if FFilialCons=Nil then
    FFilialCons:=TFFilialCons.Create(Application);
  if FFilialCons.ShowModal=MrOk then
    begin
      ME5CodFilial.Text:=FloatToStr(DMFilial.QFilialConsCod_Filial.Value);
    end;
end;

procedure TFContabilParam.ME5CodFilialChange(Sender: TObject);
begin
  inherited;
  if Trim(ME5CodFilial.Text)<>'' then
    ME5DescFilial.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME5CodFilial.Text)
  else
    Me5DescFilial.Text := 'Todas';
end;

procedure TFContabilParam.BitBtn12Click(Sender: TObject);
begin
  inherited;
  if FFilialCons=Nil then
    FFilialCons:=TFFilialCons.Create(Application);
  if FFilialCons.ShowModal=MrOk then
    begin
      ME6CodFilial.Text:=FloatToStr(DMFilial.QFilialConsCod_Filial.Value);
      ME6CodFilialExit(SELF);
    end;
end;

procedure TFContabilParam.ME6CodFilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME6CodFilial.Text)<>'' then
    ME6DescFilial.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME6CodFilial.Text)
  else
    Me6DescFilial.Text := 'Todas';
end;

procedure TFContabilParam.BitBtn7FilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons=Nil then
    FFilialCons:=TFFilialCons.Create(Application);
  if FFilialCons.ShowModal=MrOk then
    begin
      ME7Filial.Text:=FloatToStr(DMFilial.QFilialConsCod_Filial.Value);
      Ed7Filial.text:=DMFilial.QFilialConsDesc_Filial.Text;
    end;
end;

procedure TFContabilParam.ME7FilialExit(Sender: TObject);
begin
  inherited;
   if Trim(ME7Filial.Text)<>'' then
    Ed7Filial.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME7Filial.Text)
  else
    Ed7Filial.Text := 'Todas';
end;

procedure TFContabilParam.ME8FilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME8Filial.Text) <> '' then
    Ed8Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME8Filial.Text)
  else
    Ed8Filial.Text := 'Todas';
end;

procedure TFContabilParam.BT8FilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons:=TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
    ME8Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
  ME8FilialExit(Self);
end;

procedure TFContabilParam.ME9FilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME9Filial.Text) <> '' then
    Ed9Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME9Filial.Text)
  else
    Ed9Filial.Text := 'Todas';
end;

procedure TFContabilParam.Bt9FilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons:=TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
    ME9Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    ME9FilialExit(Self);
end;

procedure TFContabilParam.ME9CadastroExit(Sender: TObject);
begin
  inherited;
  if Trim(ME9Cadastro.Text) <> '' then
    Ed9Cadastro.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME9Cadastro.Text)
  else
    Ed9Cadastro.Text := 'Todos';
end;

procedure TFContabilParam.Bt9CadastroClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
    FCadastroCons:=TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
    ME9Cadastro.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
  ME9CadastroExit(Self);
end;

procedure TFContabilParam.SB10FilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons:=TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
    ME10Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    ME10FilialExit(Self); 
end;

procedure TFContabilParam.ME10FilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME10Filial.Text) <> '' then
    Ed10Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME10Filial.Text)
  else
    Ed10Filial.Text := 'Todas';
end;

procedure TFContabilParam.SB10ContaInicialClick(Sender: TObject);
begin
  inherited;
  if FPlanoContaCons=Nil then
    FPlanoContaCons:=TFPlanoContaCons.Create(Application);
  if FPlanoContaCons.ShowModal=mrOk then
    ME10ContaInicial.Text:=DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;
    ME10ContaInicialExit(self);
end;

procedure TFContabilParam.ME10ContaInicialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME10ContaInicial.Text) <> '' then
    Ed10ContaInicial.Text := DMOracle.BuscaNome('SELECT DESC_PLANO_CONTA FROM TB_PLANO_CONTA','NUM_PLANO_CONTA = '+chr(39)+ME10ContaInicial.Text+chr(39))
  else
    Ed10ContaInicial.Text := 'Todas';

end;

procedure TFContabilParam.Me1CodFilialFinalChange(Sender: TObject);
begin
  inherited;
  if Trim(ME1CodFilialFinal.Text)<>'' then
    ME1FilialFinal.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME1CodFilialFinal.Text)
  else
    ME1FilialFinal.Text:='Todas';
end;

procedure TFContabilParam.Bt1FilialFinalClick(Sender: TObject);
begin
  inherited;
  if FFilialCons=Nil then
    FFilialCons:=TFFilialCons.Create(Application);
  if FFilialCons.ShowModal=MrOk then
     ME1CodFilialFinal.Text:=FloatToStr(DMFilial.QFilialConsCod_Filial.Value);

end;

procedure TFContabilParam.Me3CodFilialFinalChange(Sender: TObject);
begin
  inherited;
  if Trim(ME3CodFilialFinal.Text)<>'' then
    ME3FilialFinal.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME3CodFilialFinal.Text)
  else
    ME3FilialFinal.Text:='Todas';

end;

procedure TFContabilParam.Bt3FilialFinalClick(Sender: TObject);
begin
  inherited;
  if FFilialCons=Nil then
    FFilialCons:=TFFilialCons.Create(Application);
  if FFilialCons.ShowModal=MrOk then
     ME3CodFilialFinal.Text:=FloatToStr(DMFilial.QFilialConsCod_Filial.Value);

end;

procedure TFContabilParam.Bt0Filial1Click(Sender: TObject);
begin
  inherited;
  if FFilialCons=Nil then
    FFilialCons:=TFFilialCons.Create(Application);
  if FFilialCons.ShowModal=MrOk then
      Me0CodFilial1.Text:=FloatToStr(DMFilial.QFilialConsCod_Filial.Value);

end;

procedure TFContabilParam.ME0CodFilial1Change(Sender: TObject);
begin
  inherited;
  if Trim(ME0CodFilial1.Text)<>'' then
    Ed0Filial1.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME0CodFilial1.Text)
  else
    Ed0Filial1.Text:='Todas';

end;

end.
