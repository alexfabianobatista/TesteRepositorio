unit ULancamentoCons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTConsulta, DB, Grids, DBGrids, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, DBDirceu, UFmConvenio, UFmDatas, UFmMedico;

type
  TFLancamentoCons = class(TFTConsulta)
    Bevel1: TBevel;
    RgTipoPagamento: TRadioGroup;
    FmMedico: TFmMedico;
    FmDatasLancamento: TFmDatas;
    FmConvenio: TFmConvenio;
    FmDatasPagamento: TFmDatas;
    RGSituacaoCons: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLancamentoCons: TFLancamentoCons;

implementation

uses ULancamento_cl, UMedicoCons, UMedico_cl, Math;

{$R *.dfm}

procedure TFLancamentoCons.FormCreate(Sender: TObject);
begin
  inherited;
  DSConsulta.DataSet := DMLancamento.QLancamentoCons;
end;

procedure TFLancamentoCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  //Processamento da Consulta
  with DMLancamento do
  begin
    QLancamentoCons.Close;

    //Frames------------------
    if Trim(FmMedico.MeMedico.Text) <> '' then
      QLancamentoCons.SetVariable('MEDICO', Trim(FmMedico.MeMedico.Text))
    else
      QLancamentoCons.SetVariable('MEDICO', null);

    if Trim(FmConvenio.MeConvenio.Text) <> '' then
      QLancamentoCons.SetVariable('CONVENIO', Trim(FmConvenio.MeConvenio.Text))
    else
      QLancamentoCons.SetVariable('CONVENIO', null);

    if Trim(METexto.Text) <> '' then
      QLancamentoCons.SetVariable('PACIENTE', Trim(METexto.Text))
    else
      QLancamentoCons.SetVariable('PACIENTE', null);

    Case RgTipoPagamento.ItemIndex of
      0 : QLancamentoCons.SetVariable('TIPO_PAGAMENTO','C');
      1 : QLancamentoCons.SetVariable('TIPO_PAGAMENTO','P');
      2 : QLancamentoCons.SetVariable('TIPO_PAGAMENTO', null);
    End;

    if (Trim(FmDatasLancamento.MeDtInicial.Text) = '') or (Trim(FmDatasLancamento.MeDtFinal.Text) = '') then
    Begin
      QLancamentoCons.SetVariable('DT_LANC_I', null);
      QLancamentoCons.SetVariable('DT_LANC_F', null);
    end
    else
    begin
      QLancamentoCons.SetVariable('DT_LANC_I', Trim(FmDatasLancamento.MeDtInicial.Text));
      QLancamentoCons.SetVariable('DT_LANC_F', Trim(FmDatasLancamento.MeDtFinal.Text));
    end;

    if (Trim(FmDatasPagamento.MeDtInicial.Text) = '') or (Trim(FmDatasPagamento.MeDtFinal.Text) = '') then
    Begin
      QLancamentoCons.SetVariable('DT_PGTO_I', null);
      QLancamentoCons.SetVariable('DT_PGTO_F', null);
    end
    else
    begin
      QLancamentoCons.SetVariable('DT_PGTO_I', Trim(FmDatasPagamento.MeDtInicial.Text));
      QLancamentoCons.SetVariable('DT_PGTO_F', Trim(FmDatasPagamento.MeDtFinal.Text));
    end;
    Case RgSituacaoCons.ItemIndex of
      0 : QLancamentoCons.SetVariable('SITUACAO','N');
      1 : QLancamentoCons.SetVariable('SITUACAO','P');
      2 : QLancamentoCons.SetVariable('SITUACAO', null);
    End;

    QLancamentoCons.Open;
  end;
  //-------------------------
end;

procedure TFLancamentoCons.FormActivate(Sender: TObject);
begin
  inherited;
  //Atribui Datas aos Lancamentos
  //FmDatasLancamento.MeDtInicial.Text := DateToStr(Date - 31);
  //FmDatasLancamento.MeDtFinal.Text   := DateToStr(Date);
  //FmDatasPagamento.MeDtInicial.Text  := DateToStr(Date - 31);
  //FmDatasPagamento.MeDtFinal.Text    := DateToStr(Date);
  //------------------------------
end;

end.
