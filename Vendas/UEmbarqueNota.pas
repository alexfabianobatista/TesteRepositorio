unit UEmbarqueNota;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Db, Grids, DBGrids, Mask;

type
  TFEmbarqueNota = class(TForm)
    Label1: TLabel;
    MeNrNota: TMaskEdit;
    DBGrid1: TDBGrid;
    DSEmbarqueNota: TDataSource;
    BitBtn1: TBitBtn;
    Label2: TLabel;
    MeData: TMaskEdit;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEmbarqueNota: TFEmbarqueNota;

implementation

uses UEmbarque_cl;

{$R *.DFM}

procedure TFEmbarqueNota.BitBtn1Click(Sender: TObject);
begin
  With DMEmbarque Do
  Begin
    QNotaEmbarque.Close;
    QNotaEmbarque.SetVariable('Nota',StrToInt(Trim(MeNrNota.Text)));
    QNotaEmbarque.SetVariable('Dt_Recebimento',StrToDate(Trim(Medata.Text)));
    QNotaEmbarque.Open;
  End;
end;

end.
