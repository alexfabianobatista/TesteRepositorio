unit UFmDepartamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Buttons, Mask;

type
  TFmDepartamento = class(TFrame)
    Label1: TLabel;
    MeDepartamento: TMaskEdit;
    BtDepartamento: TBitBtn;
    EdDepartamento: TEdit;
    procedure BtDepartamentoClick(Sender: TObject);
    procedure MeDepartamentoExit(Sender: TObject);
    procedure MeDepartamentoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses UDepartamentoCons, UDepartamento_cl, UOracle_cl;

{$R *.dfm}

procedure TFmDepartamento.BtDepartamentoClick(Sender: TObject);
begin
  if FDepartamentoCons = Nil then
    FDepartamentoCons := TFDepartamentoCons.Create(Application);
  if FDepartamentoCons.ShowModal = MrOk then
  begin
    MeDepartamento.Text := DMDepartamento.QDepartamentoConsCOD_DEPARTAMENTO.Text;
    MeDepartamentoExit(Self);
  end;
end;

procedure TFmDepartamento.MeDepartamentoExit(Sender: TObject);
begin
   if Trim(MeDepartamento.Text) <> '' then
    EdDepartamento.Text := DMOracle.BuscaNome('SELECT DESC_DEPARTAMENTO FROM TB_DEPARTAMENTO','COD_DEPARTAMENTO = ' + MeDepartamento.Text, true)
  else
    EdDepartamento.Text := 'Todos';
end;

procedure TFmDepartamento.MeDepartamentoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  If Key = 123 Then  //123 = F12
     BtDepartamento.Click;
end;

end.
