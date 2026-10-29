unit ULancamentoParam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTPARAMETRO, StdCtrls, ExtCtrls, Buttons, ComCtrls, UFmConvenio,
  UFmMedico, UFmDatas;

type
  TFLancamentoParam = class(TFTParametro)
    TabSheet1: TTabSheet;
    Bevel1: TBevel;
    FmMedico1: TFmMedico;
    FmConvenio1: TFmConvenio;
    RgTipoPagamento1: TRadioGroup;
    FmDatasLancamento1: TFmDatas;
    FmDatasPagamento1: TFmDatas;
    RgQuebra1: TRadioGroup;
    TabSheet2: TTabSheet;
    Bevel2: TBevel;
    FmMedico2: TFmMedico;
    FmDatasPagamento2: TFmDatas;
    FmConvenio2: TFmConvenio;
    TabSheet3: TTabSheet;
    Bevel3: TBevel;
    FmDatasPagamento3: TFmDatas;
    RgTipoPagamento2: TRadioGroup;
    RgTipoPagamento3: TRadioGroup;
    FmConvenio3: TFmConvenio;
    FmMedico3: TFmMedico;
    RGSituacao1: TRadioGroup;
    procedure TabSheet1Show(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure TabSheet3Show(Sender: TObject);
    procedure RgTipoPagamento2Click(Sender: TObject);
    procedure RgTipoPagamento1Click(Sender: TObject);
    procedure RgTipoPagamento3Click(Sender: TObject);
    procedure FmMedico2MeMedicoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLancamentoParam: TFLancamentoParam;

implementation

{$R *.dfm}

procedure TFLancamentoParam.TabSheet1Show(Sender: TObject);
begin
  inherited;
  //Atribui Datas aos Lancamentos e Pagamentos
  FmDatasLancamento1.MeDtInicial.Text := DateToStr(Date - 61);
  FmDatasLancamento1.MeDtFinal.Text   := DateToStr(Date);
  FmDatasPagamento1.MeDtInicial.Text  := DateToStr(Date - 61);
  FmDatasPagamento1.MeDtFinal.Text    := DateToStr(Date);
  //------------------------------
end;

procedure TFLancamentoParam.TabSheet2Show(Sender: TObject);
begin
  inherited;
  //Atribui Datas ao Pagamento
  FmDatasPagamento2.MeDtInicial.Text := DateToStr(Date - 31);
  FmDatasPagamento2.MeDtFinal.Text   := DateToStr(Date);
  //------------------------------
end;

procedure TFLancamentoParam.TabSheet3Show(Sender: TObject);
begin
  inherited;
  //Atribui Datas ao Pagamento
  FmDatasPagamento3.MeDtInicial.Text := DateToStr(Date - 31);
  FmDatasPagamento3.MeDtFinal.Text   := DateToStr(Date);
  //------------------------------
end;

procedure TFLancamentoParam.RgTipoPagamento2Click(Sender: TObject);
var
  wAux : boolean; //Variável Auxiliar para Controle de Visibilidade dos Campos que pertence ao Convênio
begin
  inherited;
  wAux := true;   //Inicializa Variável

  if RgTipoPagamento2.ItemIndex = 0 then //Opção Convênio
    wAux := true;                    //---Habilita o Campo Convênio
  if RgTipoPagamento2.ItemIndex = 1 then //Opção Particular
    wAux := false;                   //---Desabilita o Campo Convênio
  if RgTipoPagamento2.ItemIndex = 2 then //Opção Todos
    wAux := false;                   //--Desabilita o Campo Convênio

  //Campos ligados há Convênio
  //---------------------------
  FmConvenio2.Visible := wAux;
  FmConvenio2.MeConvenio.Text := '';
  //---------------------------
end;

procedure TFLancamentoParam.RgTipoPagamento1Click(Sender: TObject);
var
  wAux : boolean; //Variável Auxiliar para Controle de Visibilidade dos Campos que pertence ao Convênio
begin
  inherited;
  wAux := true;   //Inicializa Variável

  if RgTipoPagamento1.ItemIndex = 0 then //Opção Convênio
    wAux := true;                    //---Habilita o Campo Convênio
  if RgTipoPagamento1.ItemIndex = 1 then //Opção Particular
    wAux := false;                   //---Desabilita o Campo Convênio
  if RgTipoPagamento1.ItemIndex = 2 then //Opção Todos
    wAux := false;                   //--Desabilita o Campo Convênio

  //Campos ligados há Convênio
  //---------------------------
  FmConvenio1.Visible := wAux;
  FmConvenio1.MeConvenio.Text := '';
  //---------------------------
end;

procedure TFLancamentoParam.RgTipoPagamento3Click(Sender: TObject);
var
  wAux : boolean; //Variável Auxiliar para Controle de Visibilidade dos Campos que pertence ao Convênio
begin
  inherited;
  wAux := true;   //Inicializa Variável

  if RgTipoPagamento3.ItemIndex = 0 then //Opção Convênio
    wAux := true;                    //---Habilita o Campo Convênio
  if RgTipoPagamento3.ItemIndex = 1 then //Opção Particular
    wAux := false;                   //---Desabilita o Campo Convênio
  if RgTipoPagamento3.ItemIndex = 2 then //Opção Todos
    wAux := false;                   //--Desabilita o Campo Convênio

  //Campos ligados há Convênio
  //---------------------------
  FmConvenio3.Visible := wAux;
  FmConvenio3.MeConvenio.Text := '';
  //---------------------------
end;

procedure TFLancamentoParam.FmMedico2MeMedicoExit(Sender: TObject);
begin
  inherited;
  FmMedico2.MeMedicoExit(Sender);
  if Trim(FmMedico2.MeMedico.Text) = '' then
    FmMedico2.EdMedico.Text := 'Selecione um Medico';
end;

end.
