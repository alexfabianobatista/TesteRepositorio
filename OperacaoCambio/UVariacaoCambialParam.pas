unit UVariacaoCambialParam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTPARAMETRO, StdCtrls, ExtCtrls, Buttons, ComCtrls, Mask;

type
  TFVariacaoCambialParam = class(TFTParametro)
    TabSheet1: TTabSheet;
    ME0DtContabilizacao: TMaskEdit;
    Label6: TLabel;
    ME0Historico: TMaskEdit;
    Label7: TLabel;
    SpeedButton1: TSpeedButton;
    ed0Historico: TEdit;
    ME0DtVariacaoCambial: TMaskEdit;
    Label1: TLabel;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Label2: TLabel;
    Label3: TLabel;
    ME0CodReduzidoCredito: TMaskEdit;
    ME0DescContaCredito: TMaskEdit;
    ME0CodReduzidoDebito: TMaskEdit;
    ME0DescContaDebito: TMaskEdit;
    ME0ContaCredito: TMaskEdit;
    ME0ContaDebito: TMaskEdit;
    TabSheet2: TTabSheet;
    Label4: TLabel;
    Label5: TLabel;
    SpeedButton4: TSpeedButton;
    Label8: TLabel;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    Label9: TLabel;
    Label10: TLabel;
    ME1DtContabilizacao: TMaskEdit;
    ME1Historico: TMaskEdit;
    ed1Historico: TEdit;
    ME1DtVariacaoCambial: TMaskEdit;
    ME1CodReduzidoCredito: TMaskEdit;
    ME1DescContaCredito: TMaskEdit;
    ME1CodReduzidoDebito: TMaskEdit;
    ME1DescContaDebito: TMaskEdit;
    ME1ContaCredito: TMaskEdit;
    ME1ContaDebito: TMaskEdit;
    TabSheet3: TTabSheet;
    Label11: TLabel;
    Label12: TLabel;
    SpeedButton7: TSpeedButton;
    Label13: TLabel;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    Label14: TLabel;
    Label15: TLabel;
    ME2DtContabilizacao: TMaskEdit;
    ME2Historico: TMaskEdit;
    ed2Historico: TEdit;
    ME2DtVariacaoCambial: TMaskEdit;
    ME2CodReduzidoCredito: TMaskEdit;
    ME2DescContaCredito: TMaskEdit;
    ME2CodReduzidoDebito: TMaskEdit;
    ME2DescContaDebito: TMaskEdit;
    ME2ContaCredito: TMaskEdit;
    ME2ContaDebito: TMaskEdit;
    procedure SpeedButton1Click(Sender: TObject);
    procedure ME0HistoricoExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure ME0CodReduzidoDebitoExit(Sender: TObject);
    procedure ME0ContaDebitoExit(Sender: TObject);
    procedure ME0CodReduzidoCreditoExit(Sender: TObject);
    procedure ME0ContaCreditoExit(Sender: TObject);
    procedure ME1CodReduzidoDebitoExit(Sender: TObject);
    procedure ME1ContaDebitoExit(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure ME1CodReduzidoCreditoExit(Sender: TObject);
    procedure ME1ContaCreditoExit(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure ME1HistoricoExit(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure ME2CodReduzidoDebitoExit(Sender: TObject);
    procedure ME2ContaDebitoExit(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure ME2CodReduzidoCreditoExit(Sender: TObject);
    procedure ME2ContaCreditoExit(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure ME2HistoricoExit(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FVariacaoCambialParam: TFVariacaoCambialParam;

implementation

uses UHistoricoCons, UOracle_cl, UHistorico_cl, UParamSistema_cl,
  UPlanoContaCons, UPlanoConta_cl, UBiblioteca;

{$R *.DFM}

procedure TFVariacaoCambialParam.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  if FHistoricoCons = nil then
    FHistoricoCons := TFHistoricoCons.create(application);

  if FHistoricoCons.showmodal = mrok then
  begin
    ME0Historico.Text := DMHistorico.QHistoricoConsCOD_HISTORICO.Text;
    ME0HistoricoExit(Sender);
  end;
end;

procedure TFVariacaoCambialParam.ME0HistoricoExit(Sender: TObject);
begin
  inherited;
  if trim(ME0Historico.Text) <> '' then
    ed0Historico.Text :=
      DMOracle.BuscaNome('SELECT DESC_HISTORICO FROM TB_HISTORICO','COD_HISTORICO = ' + Trim(ME0Historico.Text));
end;

procedure TFVariacaoCambialParam.FormCreate(Sender: TObject);
begin
  inherited;
  Case Trunc(DMParamSistema.QParamSistemaNUM_GRAUS_CONTABIL.Value) of
    4:begin
      ME0ContaCredito.EditMask := '#.##.##.######;0;';
      ME0ContaDebito.EditMask  := '#.##.##.######;0;';
      ME1ContaCredito.EditMask := '#.##.##.######;0;';
      ME1ContaDebito.EditMask  := '#.##.##.######;0;';
      end;
    5:begin
      ME0ContaCredito.EditMask := '#.##.##.##.######;0;';
      ME0ContaDebito.EditMask  := '#.##.##.##.######;0;';
      ME1ContaCredito.EditMask := '#.##.##.##.######;0;';
      ME1ContaDebito.EditMask  := '#.##.##.##.######;0;';
      end;
    6:begin
      ME0ContaCredito.EditMask := '#.##.##.##.##.######;0;';
      ME0ContaDebito.EditMask  := '#.##.##.##.##.######;0;';
      ME1ContaCredito.EditMask := '#.##.##.##.##.######;0;';
      ME1ContaDebito.EditMask  := '#.##.##.##.##.######;0;';
      end;
  end;

  ME0DtVariacaoCambial.Text := DateToStr(Date);
  ME1DtVariacaoCambial.Text := DateToStr(Date);
  ME2DtVariacaoCambial.Text := DateToStr(Date);
end;

procedure TFVariacaoCambialParam.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons = Nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);

  If FPlanoContaCons.ShowModal = mrOk then
  begin
    ME0ContaDebito.text := DMPlanoConta.QPlanoContaConsNum_Plano_conta.Value;
    ME0ContaDebitoExit(Self);
  end;
end;

procedure TFVariacaoCambialParam.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  if FPlanoContaCons = Nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);

  if FPlanoContaCons.ShowModal = mrOk then
  begin
    ME0ContaCredito.text := DMPlanoConta.QPlanoContaConsNum_Plano_conta.Value;
    ME0ContaCreditoExit(Self);
  end;
end;

procedure TFVariacaoCambialParam.ME0CodReduzidoDebitoExit(Sender: TObject);
begin
  inherited;
  if (Trim(ME0CodReduzidoDebito.text)<>'') and (Trim(ME0CodReduzidoDebito.text)<>'0')then
  begin
    ME0DescContaDebito.Text := DMOracle.BuscaNome('SELECT DESC_PLANO_CONTA FROM TB_PLANO_CONTA','COD_REDUZIDO = '+ME0CodReduzidoDebito.Text);
    ME0ContaDebito.Text := DMOracle.BuscaNome('SELECT NUM_PLANO_CONTA FROM TB_PLANO_CONTA','COD_REDUZIDO = '+ME0CodReduzidoDebito.Text);
  end
  else
    Me0ContaDebitoExit(Self);
end;

procedure TFVariacaoCambialParam.ME0ContaDebitoExit(Sender: TObject);
begin
  inherited;
  if Trim(Bib.LimpaString(ME0ContaDebito.text,'.'))<>'' then
  begin
    ME0DescContaDebito.text  := DMOracle.BuscaNome('SELECT DESC_PLANO_CONTA FROM TB_PLANO_CONTA','NUM_PLANO_CONTA = '+ CHR(39)+Bib.LimpaString(ME0ContaDebito.text,'.')+ CHR(39));
    ME0CodReduzidoDebito.text:= DMOracle.BuscaNome('SELECT COD_REDUZIDO FROM TB_PLANO_CONTA','NUM_PLANO_CONTA = '+CHR(39)+Bib.LimpaString(ME0ContaDebito.text,'.')+CHR(39));
  end
  else
  begin
    ME0DescContaDebito.Clear;
    ME0CodReduzidoDebito.Clear;
  end;
end;

procedure TFVariacaoCambialParam.ME0CodReduzidoCreditoExit(
  Sender: TObject);
begin
  inherited;
  if (Trim(ME0CodReduzidoCredito.text)<>'') and (Trim(ME0CodReduzidoCredito.text)<>'0')then
  begin
    ME0DescContaCredito.text := DMOracle.BuscaNome('SELECT DESC_PLANO_CONTA FROM TB_PLANO_CONTA','COD_REDUZIDO = ' + ME0CodReduzidoCredito.text);
    ME0ContaCredito.text     := DMOracle.BuscaNome('SELECT NUM_PLANO_CONTA FROM TB_PLANO_CONTA','COD_REDUZIDO = '  + ME0CodReduzidoCredito.text);
  end
  else
    ME0ContaCreditoExit(Self);
end;

procedure TFVariacaoCambialParam.ME0ContaCreditoExit(Sender: TObject);
begin
  inherited;
  if Trim(Bib.LimpaString(ME0ContaCredito.text,'.'))<>'' then
  begin
    ME0DescContaCredito.text   := DMOracle.BuscaNome('SELECT DESC_PLANO_CONTA FROM TB_PLANO_CONTA','NUM_PLANO_CONTA = '+ CHR(39)+Bib.LimpaString(ME0ContaCredito.text,'.')+ CHR(39));
    ME0CodReduzidoCredito.text := DMOracle.BuscaNome('SELECT COD_REDUZIDO FROM TB_PLANO_CONTA','NUM_PLANO_CONTA = '+CHR(39)+Bib.LimpaString(ME0ContaCredito.text,'.')+CHR(39));
  end
  else
  begin
    ME0DescContaCredito.Clear;
    ME0CodReduzidoCredito.Clear;
  end;
end;

procedure TFVariacaoCambialParam.ME1CodReduzidoDebitoExit(Sender: TObject);
begin
  inherited;
  if (Trim(ME1CodReduzidoDebito.text)<>'') and (Trim(ME1CodReduzidoDebito.text)<>'0')then
  begin
    ME1DescContaDebito.Text := DMOracle.BuscaNome('SELECT DESC_PLANO_CONTA FROM TB_PLANO_CONTA','COD_REDUZIDO = '+ME1CodReduzidoDebito.Text);
    ME1ContaDebito.Text := DMOracle.BuscaNome('SELECT NUM_PLANO_CONTA FROM TB_PLANO_CONTA','COD_REDUZIDO = '+ME1CodReduzidoDebito.Text);
  end
  else
    Me1ContaDebitoExit(Self);
end;

procedure TFVariacaoCambialParam.ME1ContaDebitoExit(Sender: TObject);
begin
  inherited;
  if Trim(Bib.LimpaString(ME1ContaDebito.text,'.'))<>'' then
  begin
    ME1DescContaDebito.text  := DMOracle.BuscaNome('SELECT DESC_PLANO_CONTA FROM TB_PLANO_CONTA','NUM_PLANO_CONTA = '+ CHR(39)+Bib.LimpaString(ME1ContaDebito.text,'.')+ CHR(39));
    ME1CodReduzidoDebito.text:= DMOracle.BuscaNome('SELECT COD_REDUZIDO FROM TB_PLANO_CONTA','NUM_PLANO_CONTA = '+CHR(39)+Bib.LimpaString(ME1ContaDebito.text,'.')+CHR(39));
  end
  else
  begin
    ME1DescContaDebito.Clear;
    ME1CodReduzidoDebito.Clear;
  end;
end;

procedure TFVariacaoCambialParam.SpeedButton6Click(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons = Nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);

  If FPlanoContaCons.ShowModal = mrOk then
  begin
    ME1ContaDebito.text := DMPlanoConta.QPlanoContaConsNum_Plano_conta.Value;
    ME1ContaDebitoExit(Self);
  end;
end;

procedure TFVariacaoCambialParam.ME1CodReduzidoCreditoExit(
  Sender: TObject);
begin
  inherited;
  if (Trim(ME1CodReduzidoCredito.text)<>'') and (Trim(ME1CodReduzidoCredito.text)<>'0')then
  begin
    ME1DescContaCredito.text := DMOracle.BuscaNome('SELECT DESC_PLANO_CONTA FROM TB_PLANO_CONTA','COD_REDUZIDO = ' + ME1CodReduzidoCredito.text);
    ME1ContaCredito.text     := DMOracle.BuscaNome('SELECT NUM_PLANO_CONTA FROM TB_PLANO_CONTA','COD_REDUZIDO = '  + ME1CodReduzidoCredito.text);
  end
  else
    ME1ContaCreditoExit(Self);
end;

procedure TFVariacaoCambialParam.ME1ContaCreditoExit(Sender: TObject);
begin
  inherited;
  if Trim(Bib.LimpaString(ME1ContaCredito.text,'.'))<>'' then
  begin
    ME1DescContaCredito.text   := DMOracle.BuscaNome('SELECT DESC_PLANO_CONTA FROM TB_PLANO_CONTA','NUM_PLANO_CONTA = '+ CHR(39)+Bib.LimpaString(ME1ContaCredito.text,'.')+ CHR(39));
    ME1CodReduzidoCredito.text := DMOracle.BuscaNome('SELECT COD_REDUZIDO FROM TB_PLANO_CONTA','NUM_PLANO_CONTA = '+CHR(39)+Bib.LimpaString(ME1ContaCredito.text,'.')+CHR(39));
  end
  else
  begin
    ME1DescContaCredito.Clear;
    ME1CodReduzidoCredito.Clear;
  end;
end;

procedure TFVariacaoCambialParam.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  if FPlanoContaCons = Nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);

  if FPlanoContaCons.ShowModal = mrOk then
  begin
    ME1ContaCredito.text := DMPlanoConta.QPlanoContaConsNum_Plano_conta.Value;
    ME1ContaCreditoExit(Self);
  end;
end;

procedure TFVariacaoCambialParam.ME1HistoricoExit(Sender: TObject);
begin
  inherited;
  if trim(ME1Historico.Text) <> '' then
    ed1Historico.Text :=
      DMOracle.BuscaNome('SELECT DESC_HISTORICO FROM TB_HISTORICO','COD_HISTORICO = ' + Trim(ME1Historico.Text));
end;

procedure TFVariacaoCambialParam.SpeedButton4Click(Sender: TObject);
begin
  inherited;
  if FHistoricoCons = nil then
    FHistoricoCons := TFHistoricoCons.create(application);

  if FHistoricoCons.showmodal = mrok then
  begin
    ME1Historico.Text := DMHistorico.QHistoricoConsCOD_HISTORICO.Text;
    ME1HistoricoExit(Sender);
  end;
end;

procedure TFVariacaoCambialParam.ME2CodReduzidoDebitoExit(Sender: TObject);
begin
  inherited;
  if (Trim(ME2CodReduzidoDebito.text)<>'') and (Trim(ME2CodReduzidoDebito.text)<>'0')then
  begin
    ME2DescContaDebito.Text := DMOracle.BuscaNome('SELECT DESC_PLANO_CONTA FROM TB_PLANO_CONTA','COD_REDUZIDO = '+ME2CodReduzidoDebito.Text);
    ME2ContaDebito.Text := DMOracle.BuscaNome('SELECT NUM_PLANO_CONTA FROM TB_PLANO_CONTA','COD_REDUZIDO = '+ME2CodReduzidoDebito.Text);
  end
  else
    Me2ContaDebitoExit(Self);
end;

procedure TFVariacaoCambialParam.ME2ContaDebitoExit(Sender: TObject);
begin
  inherited;
  if Trim(Bib.LimpaString(ME2ContaDebito.text,'.'))<>'' then
  begin
    ME2DescContaDebito.text  := DMOracle.BuscaNome('SELECT DESC_PLANO_CONTA FROM TB_PLANO_CONTA','NUM_PLANO_CONTA = '+ CHR(39)+Bib.LimpaString(ME2ContaDebito.text,'.')+ CHR(39));
    ME2CodReduzidoDebito.text:= DMOracle.BuscaNome('SELECT COD_REDUZIDO FROM TB_PLANO_CONTA','NUM_PLANO_CONTA = '+CHR(39)+Bib.LimpaString(ME2ContaDebito.text,'.')+CHR(39));
  end
  else
  begin
    ME2DescContaDebito.Clear;
    ME2CodReduzidoDebito.Clear;
  end;
end;

procedure TFVariacaoCambialParam.SpeedButton9Click(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons = Nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);

  If FPlanoContaCons.ShowModal = mrOk then
  begin
    ME2ContaDebito.text := DMPlanoConta.QPlanoContaConsNum_Plano_conta.Value;
    ME2ContaDebitoExit(Self);
  end;
end;

procedure TFVariacaoCambialParam.ME2CodReduzidoCreditoExit(
  Sender: TObject);
begin
  inherited;
  if (Trim(ME2CodReduzidoCredito.text)<>'') and (Trim(ME2CodReduzidoCredito.text)<>'0')then
  begin
    ME2DescContaCredito.text := DMOracle.BuscaNome('SELECT DESC_PLANO_CONTA FROM TB_PLANO_CONTA','COD_REDUZIDO = ' + ME2CodReduzidoCredito.text);
    ME2ContaCredito.text     := DMOracle.BuscaNome('SELECT NUM_PLANO_CONTA FROM TB_PLANO_CONTA','COD_REDUZIDO = '  + ME2CodReduzidoCredito.text);
  end
  else
    ME2ContaCreditoExit(Self);
end;

procedure TFVariacaoCambialParam.ME2ContaCreditoExit(Sender: TObject);
begin
  inherited;
  if Trim(Bib.LimpaString(ME2ContaCredito.text,'.'))<>'' then
  begin
    ME2DescContaCredito.text   := DMOracle.BuscaNome('SELECT DESC_PLANO_CONTA FROM TB_PLANO_CONTA','NUM_PLANO_CONTA = '+ CHR(39)+Bib.LimpaString(ME2ContaCredito.text,'.')+ CHR(39));
    ME2CodReduzidoCredito.text := DMOracle.BuscaNome('SELECT COD_REDUZIDO FROM TB_PLANO_CONTA','NUM_PLANO_CONTA = '+CHR(39)+Bib.LimpaString(ME2ContaCredito.text,'.')+CHR(39));
  end
  else
  begin
    ME2DescContaCredito.Clear;
    ME2CodReduzidoCredito.Clear;
  end;
end;

procedure TFVariacaoCambialParam.SpeedButton8Click(Sender: TObject);
begin
  inherited;
  if FPlanoContaCons = Nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);

  if FPlanoContaCons.ShowModal = mrOk then
  begin
    ME2ContaCredito.text := DMPlanoConta.QPlanoContaConsNum_Plano_conta.Value;
    ME2ContaCreditoExit(Self);
  end;
end;

procedure TFVariacaoCambialParam.ME2HistoricoExit(Sender: TObject);
begin
  inherited;
  if trim(ME2Historico.Text) <> '' then
    ed2Historico.Text :=
      DMOracle.BuscaNome('SELECT DESC_HISTORICO FROM TB_HISTORICO','COD_HISTORICO = ' + Trim(ME2Historico.Text));

end;

procedure TFVariacaoCambialParam.SpeedButton7Click(Sender: TObject);
begin
  inherited;
  if FHistoricoCons = nil then
    FHistoricoCons := TFHistoricoCons.create(application);

  if FHistoricoCons.showmodal = mrok then
  begin
    ME2Historico.Text := DMHistorico.QHistoricoConsCOD_HISTORICO.Text;
    ME2HistoricoExit(Sender);
  end;
end;

end.
 