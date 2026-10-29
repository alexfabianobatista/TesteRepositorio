unit UFmDatas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Mask;

type
  TFmDatas = class(TFrame)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    MeDtInicial: TMaskEdit;
    Label2: TLabel;
    MeDtFinal: TMaskEdit;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ChecaDatasInformadas;
  end;

implementation

{$R *.dfm}
  procedure TFmDatas.ChecaDatasInformadas;
  begin
    if (Trim(MEDtInicial.Text) = '') or
      (Trim(MEDtFinal.TExt) = '') then
    begin
      MessageDlg('Datas inicial e final devem ser informadas.',
        mtError, [mbOk], 0);
      Abort;
    end;
  end;
end.
