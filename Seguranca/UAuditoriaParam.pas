unit UAuditoriaParam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTPARAMETRO, StdCtrls, ExtCtrls, Buttons, ComCtrls;

type
  TFAuditoriaParam = class(TFTParametro)
    TabSheet1: TTabSheet;
    RGTela: TRadioGroup;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    procedure RGTelaClick(Sender: TObject);
    procedure PGRelatorioChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAuditoriaParam: TFAuditoriaParam;

implementation

{$R *.dfm}

procedure TFAuditoriaParam.RGTelaClick(Sender: TObject);
begin
  inherited;
  case FAuditoriaParam.RGTela.ItemIndex of
    0 :
    Begin
      FAuditoriaParam.PGRelatorio.Pages[1].TabVisible := True;
      FAuditoriaParam.PGRelatorio.ActivePageIndex := 1;
    end;
    1 :
    Begin
      FAuditoriaParam.PGRelatorio.Pages[2].TabVisible := True;
      FAuditoriaParam.PGRelatorio.ActivePageIndex := 2;
    end;
    2 :
    Begin
      FAuditoriaParam.PGRelatorio.Pages[3].TabVisible := True;
      FAuditoriaParam.PGRelatorio.ActivePageIndex := 3;
    end;
    3 :
    Begin
      FAuditoriaParam.PGRelatorio.Pages[4].TabVisible := True;
      FAuditoriaParam.PGRelatorio.ActivePageIndex := 4;
    end;
  end; 
end;

procedure TFAuditoriaParam.PGRelatorioChange(Sender: TObject);
begin
  inherited;


    FAuditoriaParam.PGRelatorio.Pages[1].TabVisible := False;

    FAuditoriaParam.PGRelatorio.Pages[2].TabVisible := False;

    FAuditoriaParam.PGRelatorio.Pages[3].TabVisible := False;

    FAuditoriaParam.PGRelatorio.Pages[4].TabVisible := False;  
end;

end.
