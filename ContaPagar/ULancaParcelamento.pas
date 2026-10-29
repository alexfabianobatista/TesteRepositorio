unit ULancaParcelamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, UFmDepartamento, UFmCadastro, UFmFilial, Buttons,
  UFmBanco, UFmContaCorrente;

type
  TFLancaParcelamento = class(TForm)
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    ME1NumTitulo: TMaskEdit;
    ME1Finalidade: TMaskEdit;
    ME1ValParcela: TMaskEdit;
    ME1NumParcela: TMaskEdit;
    Label8: TLabel;
    ME1PrimVencimento: TMaskEdit;
    SB1Finalidade: TSpeedButton;
    Ed1Finalidade: TEdit;
    FmFilial1: TFmFilial;
    FmCadastro1: TFmCadastro;
    FmDepartamento1: TFmDepartamento;
    SBConfirma: TSpeedButton;
    Label1: TLabel;
    ME1Dtemissao: TMaskEdit;
    Me1PrimeiraParc: TMaskEdit;
    Label6: TLabel;
    FmContaCorrente1: TFmContaCorrente;
    MeObservacaoLancamento: TMaskEdit;
    Label7: TLabel;
    procedure SB1FinalidadeClick(Sender: TObject);
    procedure ME1FinalidadeExit(Sender: TObject);
    procedure SBConfirmaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLancaParcelamento: TFLancaParcelamento;

implementation

uses UFinalidadeCons, UOracle_cl, UFinalidade_cl, UContasReceber_cl,
  UContasPagar_cl;

{$R *.dfm}

procedure TFLancaParcelamento.SB1FinalidadeClick(Sender: TObject);
begin
  If FFinalidadeCons=Nil then
    FFinalidadeCons:=TFFinalidadeCons.Create(Application);
  If FFinalidadeCons.ShowModal=mrOk then
    ME1Finalidade.Text:=DMFinalidade.QFinalidadeConsCod_Finalidade.Text;
    ME1FinalidadeExit(self);

end;

procedure TFLancaParcelamento.ME1FinalidadeExit(Sender: TObject);
begin
  If Trim(ME1Finalidade.Text)<>'' then
    Ed1Finalidade.Text:=DMOracle.BuscaNome('SELECT DESC_FINALIDADE FROM TB_FINALIDADE','COD_FINALIDADE = '+ME1Finalidade.Text)
  Else
    Ed1Finalidade.Clear;

end;

procedure TFLancaParcelamento.SBConfirmaClick(Sender: TObject);
var
  wParcela, wNumParcelas: integer;
  wDiaVencimento : string;
  wProxVencimento :Tdatetime;
begin
  if ((Trim(FMFilial1.MeFilial.Text) = '') or (Trim(FMCadastro1.MeCadastro.Text) = '')        or
      (Trim(FMDepartamento1.MeDepartamento.Text) = '') or (Trim(ME1Finalidade.Text) = '')     or
      (Trim(ME1ValParcela.Text) = '')      or (Trim(Me1NumParcela.Text) = '')                 or
      (Trim(ME1NumTitulo.Text) = '')       or (Trim(ME1PrimVencimento.Text) = '')             or
      (Trim(ME1Dtemissao.Text) = ''))      or (Trim(Me1PrimeiraParc.Text) = '')               Then
    Raise Exception.Create('Informe todos os Campos!')
  else
    with DMContasPagar do
    Begin
      wParcela := StrToInt(Trim(Me1PrimeiraParc.Text));
      wDiaVencimento := copy(ME1PrimVencimento.Text,1,2);
      wProxVencimento:= StrToDate(ME1PrimVencimento.Text);
      wNumParcelas := 1;
      try
        DMOracle.DBCemapa.StartTransaction;

        While wNumParcelas <= StrToInt(Trim(Me1NumParcela.Text)) Do
        Begin
          QContasPagar_Cab.Close;
          QContasPagar_Mov.Close;
          QContasPagar_Mov.open;
          QContasPagar_Cab.Open;
          QContasPagar_Cab.Insert;
          QContasPagar_CabCOD_FILIAL.Value := StrToint(Trim(FmFilial1.MeFilial.Text));
          QContasPagar_CabCOD_FINALIDADE.Value   := StrToInt(Trim(ME1Finalidade.Text));
          QContasPagar_CabCOD_CADASTRO.Value  := StrToInt(Trim(FmCadastro1.MECadastro.Text));
          QContasPagar_CabCOD_DEPARTAMENTO.Value := StrToInt(Trim(FmDepartamento1.MeDepartamento.Text));
          QContasPagar_CabVAL_TITULO.Value := StrToFloat(Trim(ME1ValParcela.Text));
          QContasPagar_CabNUM_PARCELA.Value := wParcela;
          QContasPagar_CabNUM_TITULO.Value := StrToInt(Trim(ME1NumTitulo.Text));
          QContasPagar_CabDT_EMISSAO.Value := StrToDate(Trim(ME1DtEmissao.Text));
          QContasPagar_CabDT_VENCIMENTO.Value := wProxVencimento;
          QContasPagar_CabDT_CAPITALIZACAO.Value := QContasPagar_CabDT_VENCIMENTO.Value;
          QContasPagar_CabIND_SITUACAO.Value := 'ABERTO';
          if Trim(FmContaCorrente1.MeContaCorrente.Text) <> '' then
            QContasPagar_CabCod_Conta_Corrente.Value := StrToInt(Trim(FmContaCorrente1.MeContaCorrente.Text));
          QContasPagar_CabDESC_OBSERVACAO.Value  := Trim(MeObservacaoLancamento.Text);
          inc(wParcela);
          inc(wNumParcelas);
          wProxVencimento := wProxVencimento + 1 ;
          while wDiaVencimento <> copy(DateToStr(wProxVencimento),1,2) do
             wProxVencimento := wProxVencimento +1;
          QContasPagar_Cab.Post;
        end;
        DMOracle.DBCemapa.Commit;
        ShowMessage('Parcelas Lançadas com Sucesso!');
        FMFilial1.MeFilial.Clear;
        FMCadastro1.MeCadastro.Clear;
        FMDepartamento1.MeDepartamento.Clear;
        ME1Finalidade.Clear;
        ME1ValParcela.Clear;
        Me1NumParcela.Clear;
        ME1NumTitulo.Clear;
        ME1PrimVencimento.Clear;
        ME1DtEmissao.Clear;
        Me1PrimeiraParc.Clear;
        FmContaCorrente1.MeContaCorrente.Clear;
        MeObservacaoLancamento.Clear;
      Except
        DMOracle.DBCemapa.Rollback;
      end;
    end;
end;

end.
