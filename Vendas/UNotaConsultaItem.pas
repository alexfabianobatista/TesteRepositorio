unit UNotaConsultaItem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons;

type
  TFConsultaNotaItem = class(TFTConsulta)
    Label2: TLabel;
    MEFilial: TMaskEdit;
    BtConsFilial: TBitBtn;
    MEDtInicial: TMaskEdit;
    Label3: TLabel;
    procedure BtConsFilialClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FConsultaNotaItem: TFConsultaNotaItem;

implementation

uses UNotaSaida_cl, UFilialCons, UFilial_cl;

{$R *.DFM}

procedure TFConsultaNotaItem.BtConsFilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  Begin
    MEFilial.Text := DMFilial.QFilialConsCod_Filial.Text;
   // MEFilialExit(Self);
  End;

end;

procedure TFConsultaNotaItem.FormCreate(Sender: TObject);
begin
  inherited;
  MEDtInicial.Text := DateToStr(Date);
end;

end.
