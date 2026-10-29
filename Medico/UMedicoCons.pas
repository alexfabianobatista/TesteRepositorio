unit UMedicoCons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTConsulta, DB, Grids, DBGrids, StdCtrls, Mask, Buttons,
  ExtCtrls;

type
  TFMedicoCons = class(TFTConsulta)
    Bevel1: TBevel;
    LblCodigo: TLabel;
    MeCodigo: TMaskEdit;
    procedure FormCreate(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMedicoCons: TFMedicoCons;

implementation

uses UMedico_cl;

{$R *.dfm}

procedure TFMedicoCons.FormCreate(Sender: TObject);
begin
  inherited;
  DSConsulta.DataSet := DMMedico.QMedicoCons;
end;

procedure TFMedicoCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  //Processamento da Consulta
  //-------------------------
  with DMMedico do
  begin
    QMedicoCons.Close;

    //Verifica se CODIGO MEDICO está Preenchido
    if Trim(MeCodigo.Text) <> '' then
      QMedicoCons.SetVariable('CODIGO', Trim(MeCodigo.Text))
    else
      QMedicoCons.SetVariable('CODIGO', null);

    //Verifica se NOME MEDICO está Preenchido
    if Trim(METexto.Text) <> '' then
      QMedicoCons.SetVariable('NOME', Trim(METexto.Text))
    else
      QMedicoCons.SetVariable('NOME', null);

    QMedicoCons.Open;
  end;
  //-------------------------
end;

end.
