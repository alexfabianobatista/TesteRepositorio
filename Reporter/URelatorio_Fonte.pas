unit URelatorio_Fonte;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, Buttons, Mask, DBCtrls;

type
  TFRelatorio_Fonte = class(TForm)
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBCBMascara: TDBComboBox;
    BitBtn2: TBitBtn;
    DBComboBox2: TDBComboBox;
    Label5: TLabel;
    DBEControle: TDBEdit;
    procedure BitBtn2Click(Sender: TObject);
    procedure DBEControleChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRelatorio_Fonte: TFRelatorio_Fonte;

implementation

uses URelatorio_cl, UReporterWiz;

{$R *.DFM}

procedure TFRelatorio_Fonte.BitBtn2Click(Sender: TObject);
begin
  FReporterWiz.DestroyPainel;
  FReporterWiz.AtuPainel;
end;

procedure TFRelatorio_Fonte.DBEControleChange(Sender: TObject);
begin
  DBCBMascara.Enabled := DMRelatorio.QSelectDesc_Tipo_Dado.Value = 'NUMBER';
end;

end.
