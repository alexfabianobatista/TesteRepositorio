unit UContratoMensalReajuste;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, Mask;

type
  TFContratoMensalReajuste = class(TForm)
    Label89: TLabel;
    MeFilial: TMaskEdit;
    SpeedButton51: TSpeedButton;
    EdFilial: TMaskEdit;
    Label1: TLabel;
    MeCadastro: TMaskEdit;
    SpeedButton1: TSpeedButton;
    EdCadastro: TMaskEdit;
    MeData: TMaskEdit;
    Label2: TLabel;
    MeMes: TMaskEdit;
    Label3: TLabel;
    MeIndice: TMaskEdit;
    Label4: TLabel;
    BtOk: TBitBtn;
    BtCancela: TBitBtn;
    procedure MeFilialChange(Sender: TObject);
    procedure SpeedButton51Click(Sender: TObject);
    procedure MeCadastroChange(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BtOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FContratoMensalReajuste: TFContratoMensalReajuste;

implementation

uses UOracle_cl, UFilialCons, UFilial_cl, UCadastroCons, UCadastro_cl,
  UOrdemServico_cl;

{$R *.dfm}

procedure TFContratoMensalReajuste.MeFilialChange(Sender: TObject);
begin
  if Trim(MEFilial.Text)<>'' then
    Begin
      EdFilial.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+MEFilial.Text);
    End
  else
    Begin
      MEFilial.Clear;
      EdFilial.Text := 'Todas';
    End;
end;

procedure TFContratoMensalReajuste.SpeedButton51Click(Sender: TObject);
begin
  if FFilialCons = nil then
    FFilialCons:=TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
    begin
      MEFilial.Text:=DMFilial.QFilialConsCod_filial.Text;
      MEFilialChange(Self);
    end;
end;

procedure TFContratoMensalReajuste.MeCadastroChange(Sender: TObject);
begin
  if Trim(MECadastro.Text)<>'' then
    Begin
      EdCadastro.Text:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+MECadastro.Text);
    End
  else
    Begin
      MECadastro.Clear;
      EdCadastro.Text := 'Todos';
    End;
end;

procedure TFContratoMensalReajuste.SpeedButton1Click(Sender: TObject);
begin
  if FCadastroCons = nil then
    FCadastroCons:=TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
    begin
      MECadastro.Text:=DMCadastro.QCadastroConsCod_Cadastro.Text;
      MECadastroChange(Self);
    end;
end;

procedure TFContratoMensalReajuste.FormActivate(Sender: TObject);
var
  wAno, wMes, wDia : word;
begin
  MeData.Text := DateToStr(Date);
end;

procedure TFContratoMensalReajuste.BtOkClick(Sender: TObject);
var
  wSQL, wDataCobranca, wUltimoReaj :String;
  wAjuste, wMes :Real;
  wData :TDateTime;
begin
  MeIndice.Text := FormatFloat('#,##0.00',StrToFloat(MEIndice.Text));
  with DMOrdemServico do
  begin
    wData := strToDate(MeData.Text);
    QConsultaMensalReaj.close;
    if Trim(MeFilial.Text) <> '' then
      QConsultaMensalReaj.SetVariable('FILIAL', Trim(MeFilial.Text))
    else
      QConsultaMensalReaj.SetVariable('FILIAL', null);

    if Trim(MeCadastro.Text) <> '' then
      QConsultaMensalReaj.SetVariable('CADASTRO', Trim(MeCadastro.Text))
    else
      QConsultaMensalReaj.SetVariable('CADASTRO', null);

    if Trim(MeMes.Text) <> '' then
      QConsultaMensalReaj.SetVariable('ULTIMO_REAJUSTE', Trim(MeMes.Text))
    else
      QConsultaMensalReaj.SetVariable('ULTIMO_REAJUSTE', null);

    QConsultaMensalReaj.open;
    QConsultaMensalReaj.First;

    while not QConsultaMensalReaj.Eof do
    begin
      QContratoMensal.close;
      QContratoMensal.SetVariable('PK', QConsultaMensalReajCOD_CONTRATO_MENSAL.Value);
      QContratoMensal.open;

      if(QContratoMensalIND_SITUACAO.Text = 'ATIVO') and (QContratoMensalDT_ULTIMO_REAJUSTE.Value <=  wData) then
      begin
        QContratoMensalReajuste.Open;
        QContratoMensalReajuste.Insert;
        QContratoMensalReajusteCOD_CONTRATO_MENSAL.Text := QContratoMensalCOD_CONTRATO_MENSAL.Text;
        QContratoMensalReajusteCOD_FILIAL.Text := QContratoMensalCOD_FILIAL.Text;
        QContratoMensalReajusteCOD_CADASTRO.Text := QContratoMensalCOD_CADASTRO.Text;
        QContratoMensalReajusteDT_REAJUSTE.Text := MeData.Text;
        wMes := StrToFloat(MeMes.Text);
        QContratoMensalReajusteMES_REAJUSTE.Text := FormatFloat('00',wMes);
        QContratoMensalReajusteINDICE_REAJUSTE.Text := MeIndice.Text;
        QContratoMensalReajuste.Post;

        wDataCobranca := QContratoMensalReajusteDT_REAJUSTE.Text;
        wDataCobranca := QContratoMensalNUM_DIA_VENCTO.Text + copy(wDataCobranca,3,8);
        wAjuste := QContratoMensalVAL_MENSALIDADE.Value * StrToFloat(MeIndice.Text) / 100;
        wAjuste := wAjuste + QContratoMensalVAL_MENSALIDADE.Value;

        QContratoMensal.Open;
        QContratoMensal.Edit;
        QContratoMensalVAL_MENSALIDADE.Value := wAjuste;
        QContratoMensalDT_ULTIMO_REAJUSTE.Text := QContratoMensalReajusteDT_REAJUSTE.Text;
        QContratoMensalMES_ULTIMO_REAJUSTE.Text := copy(QContratoMensalDT_ULTIMO_REAJUSTE.Text,4,2);
        QContratoMensalDT_INICIO_COBRANCA.Text := wDataCobranca;
        QContratoMensal.Post;

        DMOracle.DBCemapa.Commit;

        QContratoMensalReajuste.Close;
      end
      else
        ShowMessage('Contrato ' + QContratoMensalCOD_CONTRATO_MENSAL.Text + ' não Reajustado' );

      QConsultaMensalReaj.Next;
    end;
    ShowMessage('Operação Concluida');
  end;
end;

end.
