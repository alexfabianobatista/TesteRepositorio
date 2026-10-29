unit UConsultaProcessoR1070;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTConsulta, Menus, DB, Grids, DBGrids, StdCtrls, Mask, Buttons,
  UReinf_cl, ComCtrls;

type
  TFConsultaProcessoR1070 = class(TFTConsulta)
    cbTipoProcesso: TComboBox;
    Label2: TLabel;
    EdtCadastro: TEdit;
    DtInicio: TDateTimePicker;
    DtFim: TDateTimePicker;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    MEVara: TMaskEdit;
    Label6: TLabel;
    procedure BtProcurarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FConsultaProcessoR1070: TFConsultaProcessoR1070;

implementation

uses DateUtils;

{$R *.dfm}

procedure TFConsultaProcessoR1070.BtProcurarClick(Sender: TObject);
begin
  inherited;

  with DMReinf do
  begin
    QProcessoR1070Cons.Close;
    if Trim(METexto.Text) <> '' then
      QProcessoR1070Cons.SetVariable('NUM_PROCESSO', StrToInt(Trim(METexto.Text)));
    if cbTipoProcesso.Text <> '' then
      QProcessoR1070Cons.SetVariable('IND_TIPO_PROCESSO', cbTipoProcesso.ItemIndex);
    if Trim(MEVara.Text) <> '' then
      QProcessoR1070Cons.SetVariable('NUM_VARA', StrToInt(Trim(MEVara.Text)));

    if DtInicio.DateTime <> Today then
      QProcessoR1070Cons.SetVariable('DT_INI', DateToStr(DtInicio.DateTime));
    if DtFim.DateTime <> Today then
      QProcessoR1070Cons.SetVariable('DT_FIM', dateToStr(DtFim.DateTime));
    QProcessoR1070Cons.Open;
  end;

end;

procedure TFConsultaProcessoR1070.FormCreate(Sender: TObject);
begin
  inherited;
  DtInicio.DateTime := Today;
  DtFim.DateTime := Today;
end;

end.
