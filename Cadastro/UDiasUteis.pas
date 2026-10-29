unit UDiasUteis;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, Buttons;

type
  TFDiasUteis = class(TForm)
    MonthCalendar1: TMonthCalendar;
    BTIncluir: TButton;
    BtExcluir: TButton;
    SBSair: TSpeedButton;
    BtGravar: TButton;
    procedure SBSairClick(Sender: TObject);
    procedure BTIncluirClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtGravarClick(Sender: TObject);
    procedure BtExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDiasUteis: TFDiasUteis;

implementation

uses UDiasUteis_cl;

{$R *.DFM}

procedure TFDiasUteis.SBSairClick(Sender: TObject);
begin
  FDiasUteis.close;

end;

procedure TFDiasUteis.BTIncluirClick(Sender: TObject);
begin
  FDiasUteis.BtGravar.Enabled := True;
  FDiasUteis.BtExcluir.Enabled := False;
  FDiasUteis.BTIncluir.Enabled := False;

end;

procedure TFDiasUteis.FormActivate(Sender: TObject);
begin
  FDiasUteis.MonthCalendar1.Enabled:= True;
  FDiasUteis.BtGravar.Enabled := False;
  With DMDiasUteis do
    QDiasUteis.Open;
  MonthCalendar1.Date := Date;  
end;

procedure TFDiasUteis.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with DMDiasUteis do
  begin
    QDiasUteis.Close;
  end;
  Action := CaFree;
  FDiasUteis := Nil;

end;

procedure TFDiasUteis.BtGravarClick(Sender: TObject);
begin
  DMDiasUteis.QDiasUteis.close;
  DMDiasUteis.QdiasUteis.SetVariable('PK',monthcalendar1.date);
  DMDiasUteis.QDiasUteis.open;
   if DMDiasUteis.QDiasUteis.recordcount > 0 then
     begin
       Raise Exception.create('Dia Útil Já Foi Cadastrado! Selecione Outro Dia e Clique Salvar!! ');
     end
   else
    DMDiasUteis.QDiasUteis.Insert;
    DMDiasUteis.QDiasUteisDias_Uteis.Value := monthcalendar1.date;
    DMDiasUteis.QDiasUteis.Post;
    showmessage('Dia Útil Cadastrado Com Sucesso!');
    FDiasUteis.BtExcluir.Enabled := True;
    FDiasUteis.BtGravar.Enabled := False;
    FDiasUteis.BTIncluir.Enabled := True;

end;

procedure TFDiasUteis.BtExcluirClick(Sender: TObject);
begin
  DMDiasUteis.QDiasUteis.close;
  DMDiasUteis.QdiasUteis.SetVariable('PK',monthcalendar1.date);
  DMDiasUteis.QDiasUteis.open;
   if DMDiasuteis.QDiasUteis.recordcount > 0 then
     begin
     DMDiasUteis.QDiasUteis.Delete;
     showmessage('Dia excluído com sucesso');
     end
   else
     showmessage('Dia Útil não cadastrado');

  end;

end.
