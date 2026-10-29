unit UFatorICMSCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, variants;

type
  TFFatorICMSCons = class(TFTConsulta)
    MEAno: TMaskEdit;
    EdMes: TEdit;
    Label2: TLabel;
    EDFilial: TEdit;
    MEFilial: TMaskEdit;
    SBFilial: TSpeedButton;
    Label3: TLabel;
    procedure METextoExit(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
    procedure SBFilialClick(Sender: TObject);
    procedure MEFilialExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FFatorICMSCons: TFFatorICMSCons;

implementation

uses UFatorICMS_cl, UFilialCons, UOracle_cl, UFilial_cl;

{$R *.DFM}

procedure TFFatorICMSCons.METextoExit(Sender: TObject);
begin
  inherited;
  if Trim(METexto.Text) <> '' then
  begin
    case StrToInt(Trim(METexto.Text)) of
      1 : EdMes.Text := 'Janeiro';
      2 : EdMes.Text := 'Fevereiro';
      3 : EdMes.Text := 'Março';
      4 : EdMes.Text := 'Abril';
      5 : EdMes.Text := 'Maio';
      6 : EdMes.Text := 'Junho';
      7 : EdMes.Text := 'Julho';
      8 : EdMes.Text := 'Agosto';
      9 : EdMes.Text := 'Setembro';
      10 : EdMes.Text := 'Outubro';
      11 : EdMes.Text := 'Novembro';
      12 : EdMes.Text := 'Dezembro';
      else EdMes.Text := 'Mês inválido';
    end;
  end
  else
  begin
    EdMes.Text := 'Todos';
  end;
end;

procedure TFFatorICMSCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  DMFatorICMS.QFatorICMSCons.close;

  If Trim(MEFilial.Text) <> '' Then
    DMFatorICMS.QFatorICMSCons.SetVariable('COD_FILIAL', Trim(MEFilial.Text) )
  Else
    DMFatorICMS.QFatorICMSCons.SetVariable('COD_FILIAL', null);

  If Trim(METexto.Text) <> '' Then
    DMFatorICMS.QFatorICMSCons.SetVariable('MES', Trim(METexto.Text) )
  Else
    DMFatorICMS.QFatorICMSCons.SetVariable('MES', null);

  If Trim(MEAno.Text) <> '' Then
    DMFatorICMS.QFatorICMSCons.SetVariable('ANO', Trim(MEAno.Text) )
  Else
    DMFatorICMS.QFatorICMSCons.SetVariable('ANO', null);

  DMFatorICMS.QFatorICMSCons.Open;
end;

procedure TFFatorICMSCons.SBFilialClick(Sender: TObject);
begin
  inherited;
  If (FFilialCons = nil) Then
    FFilialCons := TFFilialCons.Create(Application);
  If (FFilialCons.ShowModal = mrOk) Then
    MEFilial.Text := DMFilial.QFilialConsCOD_FILIAL.Text;
  MEFilialExit(self);
end;

procedure TFFatorICMSCons.MEFilialExit(Sender: TObject);
begin
  inherited;
  If(Trim(MEFilial.Text) <> '')Then
    EdFilial.Text := DMOracle.BuscaNome( 'SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = ' + Trim(MEFilial.Text) )
  Else
    EdFilial.Text := 'Todas';
end;

end.
