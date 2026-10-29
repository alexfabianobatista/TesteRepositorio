unit USituacaoAcerto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls;

type
  TFSituacaoAcerto = class(TForm)
    RGSituacaoAcerto: TRadioGroup;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSituacaoAcerto: TFSituacaoAcerto;

implementation

uses UOracle_cl, UEmbarque_cl;

{$R *.DFM}

procedure TFSituacaoAcerto.BitBtn1Click(Sender: TObject);
var
  wComando :String;
begin
  With DMOracle do
  Begin
    case RGSituacaoAcerto.ItemIndex of
      0: wComando := 'UPDATE TB_EMBARQUE SET IND_SITUACAO = '+ chr(39) + 'ABERTO' +chr(39);
      1: wComando := 'UPDATE TB_EMBARQUE SET IND_SITUACAO = '+ chr(39) + 'ACERTADO' +chr(39);
      2: wComando := 'UPDATE TB_EMBARQUE SET IND_SITUACAO = '+ chr(39) + 'BAIXADO' +chr(39);
    end;
    try
      DMOracle.DBCemapa.StartTransaction;
      QExecSQL.Close;
      QExecSQL.SQL.Clear;
      wComando := wComando + ' WHERE COD_EMBARQUE = '+FloatToStr(DMEmbarque.QEmbarqueCod_Embarque.Value);
      QExecSQL.SQL.Add(wComando);
      QExecSQL.ExecSQL;
      DMOracle.DBCemapa.commit;
    except
      DMOracle.DBCemapa.rollback;
    end;
    DMEmbarque.QEmbarque.Close;
    DMEmbarque.QEmbarque.Open;
  End;
end;

end.
