unit URecebeBloquetoCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons;

type
  TFRecebeBloquetoCons = class(TFTConsulta)
    GroupBox1: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    MeDtRecInicio: TMaskEdit;
    MeDtRecFim: TMaskEdit;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    MeDtVencInicio: TMaskEdit;
    MeDtVencFim: TMaskEdit;
    MeNumConta: TMaskEdit;
    Label6: TLabel;
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRecebeBloquetoCons: TFRecebeBloquetoCons;

implementation

uses URecebeBloqueto_cl;

{$R *.DFM}

procedure TFRecebeBloquetoCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMRecebeBloqueto Do
  Begin
    QRecebeBloquetoCons.Close;
    If( Trim(MeTexto.Text) <> '' )Then
      QRecebeBloquetoCons.ParamByName('CODIGO').AsInteger := StrToInt(Trim(METexto.Text))
    Else
      QRecebeBloquetoCons.ParamByName('CODIGO').AsInteger := 0;

    If( Trim(MeNumConta.Text) <> '' )Then
      QRecebeBloquetoCons.ParamByName('NUM_CONTA').AsInteger := StrToInt(Trim(MeNumConta.Text))
    Else
      QRecebeBloquetoCons.ParamByName('NUM_CONTA').AsInteger := 0;

    If( Trim(MeDtRecInicio.Text) <> '' )Then
      QRecebeBloquetoCons.ParamByName('DT_REC_INI').AsDateTime := StrToDate(MeDtRecInicio.Text)
    Else
      QRecebeBloquetoCons.ParamByName('DT_REC_INI').AsDateTime := StrToDate('01/01/1900');

    If( Trim(MeDtRecFim.Text) <> '' )Then
      QRecebeBloquetoCons.ParamByName('DT_REC_FIN').AsDateTime := StrToDate(MeDtRecFim.Text)
    Else
      QRecebeBloquetoCons.ParamByName('DT_REC_FIN').AsDateTime := StrToDate('01/01/2030');

    If( Trim(MeDtVencInicio.Text) <> '' )Then
      QRecebeBloquetoCons.ParamByName('DT_VENC_INI').AsDateTime := StrToDate(MeDtVencInicio.Text)
    Else
      QRecebeBloquetoCons.ParamByName('DT_VENC_INI').AsDateTime := StrToDate('01/01/1900');

    If( Trim(MeDtVencFim.Text) <> '' )Then
      QRecebeBloquetoCons.ParamByName('DT_VENC_FIN').AsDateTime := StrToDate(MeDtVencFim.Text)
    Else
      QRecebeBloquetoCons.ParamByName('DT_VENC_FIN').AsDateTime := StrToDate('01/01/2030');

    QRecebeBloquetoCons.Open;
  End;
end;

end.
