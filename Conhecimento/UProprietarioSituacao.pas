unit UProprietarioSituacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, ExtCtrls;

type
  TFProprietarioSituacao = class(TFTConsulta)
    RgSituacao: TRadioGroup;
    procedure BtOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FProprietarioSituacao: TFProprietarioSituacao;

implementation

uses UOracle_cl, UProprietario_cl;

{$R *.DFM}

procedure TFProprietarioSituacao.BtOkClick(Sender: TObject);
begin
  inherited;
  DMOracle.QExecSQL.Close;
  DMOracle.QExecSQL.SQL.Clear;
  If FProprietarioSituacao.RgSituacao.ItemIndex = 0 Then
     DMOracle.QExecSQL.SQL.Add('UPDATE TB_PROPRIETARIO SET IND_SITUACAO = '+Chr(39) + 'A' + Chr(39))
  Else
     DMOracle.QExecSQL.SQL.Add('UPDATE TB_PROPRIETARIO SET IND_SITUACAO = '+Chr(39) + 'D' + Chr(39));
  DMOracle.QExecSQL.SQL.Add(' WHERE COD_PROPRIETARIO = '+DMProprietario.QProprietarioCadCod_Proprietario.Text);
  DMOracle.QExecSQL.ExecSQL;
  If DMOracle.DBCemapa.InTransaction Then
     DMOracle.DBCemapa.Commit;

end;

end.
