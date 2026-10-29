unit UAgendamentoCons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTConsulta, Menus, DB, Grids, DBGrids, StdCtrls, Mask, Buttons,
  DBCtrls, ExtCtrls, UFmCadastro, UFmFilial;

type
  TFAgendamentoCons = class(TFTConsulta)
    GBDataAgedamento: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    MeAgendamentoIni: TMaskEdit;
    MeAgendamentoFin: TMaskEdit;
    FmFilial1: TFmFilial;
    FmCadastro1: TFmCadastro;
    RGAtrasado: TRadioGroup;
    procedure BtProcurarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtConsFilialClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAgendamentoCons: TFAgendamentoCons;

implementation

uses UCadastro_cl, UBiblioteca, UFilialCons, UFilial_cl;

{$R *.dfm}

procedure TFAgendamentoCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  with DMCadastro do
  begin
    QAgendamentoCons.Close;
    QAgendamentoCons.ClearVariables;
    if Trim(FmFilial1.MeFilial.Text) <> '' then
      QAgendamentoCons.SetVariable('COD_FILIAL', Trim(FmFilial1.MeFilial.Text))
    else
      QAgendamentoCons.SetVariable('COD_FILIAL', Null);
    if Trim(FmCadastro1.MeCadastro.Text) <> '' then
      QAgendamentoCons.SetVariable('COD_CADASTRO', Trim(FmCadastro1.MeCadastro.Text))
    else
      QAgendamentoCons.SetVariable('COD_CADASTRO', Null);
    if (RGAtrasado.ItemIndex = 0 ) then
      QAgendamentoCons.SetVariable('IND_ATRASADO', 'SIM')
    else if (RGAtrasado.ItemIndex = 1 ) then
      QAgendamentoCons.SetVariable('IND_ATRASADO', 'NAO')
    else
      QAgendamentoCons.SetVariable('IND_ATRASADO', null);
    If Trim(MeAgendamentoIni.Text) <> '' then
      QAgendamentoCons.SetVariable('DT_AGENDAMENTO_INI', MeAgendamentoIni.Text);
    If Trim(MeAgendamentoFin.Text) <> '' then
      QAgendamentoCons.SetVariable('DT_AGENDAMENTO_FIN', MeAgendamentoFin.Text);

    QAgendamentoCons.Open;
  end;
end;

procedure TFAgendamentoCons.FormCreate(Sender: TObject);
var wDataIni, wDataFin: TDate;
begin
  inherited;
  Bib.PriUltDataVar(wDataIni, wDataFin, True);
//  MeEntradaIni.Text := FormatDateTime('dd/mm/yyyy', wDataIni);
//  MeEntradaFin.Text := FormatDateTime('dd/mm/yyyy', wDataFin);
end;

procedure TFAgendamentoCons.BtConsFilialClick(Sender: TObject);
begin
  inherited;
{  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
    MEFilial.Text := DMFilial.QFilialConsCod_Filial.Text;}
end;

end.
