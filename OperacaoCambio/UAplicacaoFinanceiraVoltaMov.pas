unit UAplicacaoFinanceiraVoltaMov;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Buttons, ExtCtrls;

type
  TFAplicacaoFinanceiraVoltaMov = class(TForm)
    SBAplicacaoMovCons: TSpeedButton;
    MECodAplicacao: TMaskEdit;
    MECodMovimento: TMaskEdit;
    MEDataMov: TMaskEdit;
    MEValorMov: TMaskEdit;
    MEHistoricoMov: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    SBVoltaMovimento: TSpeedButton;
    EdHistoricoMov: TEdit;
    RGTipoMov: TRadioGroup;
    procedure FormActivate(Sender: TObject);
    procedure SBAplicacaoMovConsClick(Sender: TObject);
    procedure SBVoltaMovimentoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAplicacaoFinanceiraVoltaMov: TFAplicacaoFinanceiraVoltaMov;

implementation

uses UAplicacaoFinanceira_cl, UAplicacaoFinanceiraMovCons, UOracle_cl;

{$R *.dfm}

procedure TFAplicacaoFinanceiraVoltaMov.FormActivate(Sender: TObject);
begin
  MECodAplicacao.Text := DMAplicacaoFinanceira.QAplicacaoFinanceiraCOD_APLICACAO_FINANCEIRA.Text;
  MECodMovimento.Text := '';
  MEDataMov.Text := '';
  MEValorMov.Text := '';
  MEHistoricoMov.Text := '';
  EdHistoricoMov.Text := '';
end;

procedure TFAplicacaoFinanceiraVoltaMov.SBAplicacaoMovConsClick(Sender: TObject);
begin
  with DMAplicacaoFinanceira do
  Begin
    If FAplicacaoFinanceiraMovCons = Nil then
      FAplicacaoFinanceiraMovCons:=TFAplicacaoFinanceiraMovCons.Create(Application);
    If FAplicacaoFinanceiraMovCons.ShowModal=mrOK then
      MECodMovimento.Text := IntToStr(QAplicacaoFinanceiraMovConsCOD_APLICACAO_FINANCEIRA_MOV.Value);
    MEDataMov.Text := QAplicacaoFinanceiraMovConsDT_MOVIMENTO.Text;
    MEValorMov.Text := QAplicacaoFinanceiraMovConsVAL_MOVIMENTO.Text;
    MEHistoricoMov.Text := QAplicacaoFinanceiraMovConsCOD_HISTORICO.Text;
    EdHistoricoMov.Text := QAplicacaoFinanceiraMovConsDESC_HISTORICO.Value;
    IF QAplicacaoFinanceiraMovConsIND_TIPO.Value = 'BAIXA' Then
      RGTipoMov.ItemIndex := 0
    else
      RGTipoMov.ItemIndex := 1;

  end;
end;

procedure TFAplicacaoFinanceiraVoltaMov.SBVoltaMovimentoClick(
  Sender: TObject);
var
wComplemento : string;
begin
  if ((MECodAplicacao.Text <> '') and (MECodMovimento.Text <> '')) then
  With DMAplicacaoFinanceira do
  Begin
    if RGTipoMov.ItemIndex = 0 then
    Begin //aqui volta baixa
      Try
        DMOracle.DBCemapa.StartTransaction;
        QAplicacaoFinanceira.Close;
        QAplicacaoFinanceira.SetVariable('PK',MECodAplicacao.Text);
        QAPlicacaoFinanceira.Open;
        QAplicacaoFinanceira.Edit;
        QAplicacaoFinanceiraVAL_APLICADO.Value := QAplicacaoFinanceiraVAL_APLICADO.Value + StrToFloat(MEValorMov.Text);

        QAplicacaoFinanceiraMov.Close;
        QAplicacaoFinanceiraMov.SetVariable('PK',MECodMovimento.Text);
        QAplicacaoFinanceiraMov.Open;

        DMOracle.QExecSQL.close;
        DMOracle.QExecSQL.SQL.Clear;
        DMOracle.QExecSQL.SQL.Add('DELETE FROM TB_BCO_MOVIMENTO WHERE NUM_CHEQUE = ' +
        QAplicacaoFinanceiraNUM_TITULO.Text + ' AND COD_CONTA_PAGAR_CAB = '+ QAplicacaoFinanceiraMovCOD_APLICACAO_FINANCEIRA_MOV.Text);
        DMOracle.QExecSQL.ExecSQL;

        wComplemento := QAplicacaoFinanceiraNUM_TITULO.Text+'-'+QAplicacaoFinanceiraMovCOD_APLICACAO_FINANCEIRA_MOV.Text+'MOVIMENTO';
        DMOracle.QExecSQL.close;
        DMOracle.QExecSQL.SQL.Clear;
        DMOracle.QExecSQL.SQL.Add('DELETE FROM TB_LANCTO_CONTABIL WHERE COD_APLICACAO_FINANCEIRA_MOV = ' +
        QAplicacaoFinanceiraMovCOD_APLICACAO_FINANCEIRA_MOV.Text + ' AND DESC_COMPLEMENTO = ' + CHR(39)+wComplemento+CHR(39));
        DMOracle.QExecSQL.ExecSQL;

        QAplicacaoFinanceiraMov.Delete;

        DMOracle.DBCemapa.Commit;
        ShowMessage('Operação efetuada com sucesso!');

        QAplicacaoFinanceira.Post;
        QAplicacaoFinanceiraMovCons.Close;
        QAplicacaoFinanceiraMovCons.Open;
        FAplicacaoFinanceiraVoltaMov.Close;

      except;
        DMOracle.DBCemapa.RollBack;
      end
    end 
    else
    Begin //aqui volta rendimento
      Try
        DMOracle.DBCemapa.StartTransaction;
        QAplicacaoFinanceira.Close;
        QAplicacaoFinanceira.SetVariable('PK',MECodAplicacao.Text);
        QAPlicacaoFinanceira.Open;
        QAplicacaoFinanceira.Edit;
        QAplicacaoFinanceiraVAL_APLICADO.Value := QAplicacaoFinanceiraVAL_APLICADO.Value - StrToFloat(MEValorMov.Text);

        QAplicacaoFinanceiraMov.Close;
        QAplicacaoFinanceiraMov.SetVariable('PK',MECodMovimento.Text);
        QAplicacaoFinanceiraMov.Open;

        wComplemento := QAplicacaoFinanceiraNUM_TITULO.Text+'-'+QAplicacaoFinanceiraMovCOD_APLICACAO_FINANCEIRA_MOV.Text+'MOVIMENTO';
        DMOracle.QExecSQL.close;
        DMOracle.QExecSQL.SQL.Clear;
        DMOracle.QExecSQL.SQL.Add('DELETE FROM TB_LANCTO_CONTABIL WHERE COD_APLICACAO_FINANCEIRA_MOV = ' +
        QAplicacaoFinanceiraMovCOD_APLICACAO_FINANCEIRA_MOV.Text + ' AND DESC_COMPLEMENTO = ' + CHR(39)+wComplemento+CHR(39));
        DMOracle.QExecSQL.ExecSQL;

        QAplicacaoFinanceiraMov.Delete;

        DMOracle.DBCemapa.Commit;
        ShowMessage('Operação efetuada com sucesso!');

        QAplicacaoFinanceira.Post;
        QAplicacaoFinanceiraMovCons.Close;
        QAplicacaoFinanceiraMovCons.Open;
        FAplicacaoFinanceiraVoltaMov.Close;

      except;
        DMOracle.DBCemapa.RollBack;
      end;
    end;
  end
  else
    Raise Exception.Create('Operação não efetuada!');
end;

end.
