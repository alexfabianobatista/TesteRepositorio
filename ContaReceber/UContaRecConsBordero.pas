unit UContaRecConsBordero;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFmFilial, StdCtrls, Buttons, Grids, DBGrids, UFmDatas, Mask,
  UFmCadastro, ImgList, DB;

type
  TFContaRecConsBordero = class(TForm)
    FmFilial1: TFmFilial;
    FmCadastro1: TFmCadastro;
    METitulo: TMaskEdit;
    Label1: TLabel;
    FmDtEmissao: TFmDatas;
    FmDtVencimento: TFmDatas;
    DBTitulos: TDBGrid;
    btProcurar: TBitBtn;
    btOk: TBitBtn;
    btCancelar: TBitBtn;
    ILChecks: TImageList;
    procedure btProcurarClick(Sender: TObject);
    procedure DBTitulosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBTitulosCellClick(Column: TColumn);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    procedure inverteSelecaoItem;
    procedure setSelecaoItem(Sel :String);
  public
    { Public declarations }
  end;

var
  FContaRecConsBordero: TFContaRecConsBordero;

implementation

uses UBordero_cl, UUsuario_cl;

{$R *.dfm}

procedure TFContaRecConsBordero.btProcurarClick(Sender: TObject);
begin
  with DMBordero do
  begin
    CDSContaReceberCons.Close;
    if Trim(FmFilial1.MeFilial.Text) <> '' then
      CDSContaReceberCons.Params.ParamByName('FILIAL').Value :=
        Trim(FmFilial1.MeFilial.Text)
    else
    begin
      MessageDlg('Filial não informada', mtError, [mbOk], 0);
      Abort;
    end;
    if Trim(FmCadastro1.MeCadastro.Text) <> '' then
      CDSContaReceberCons.Params.ParamByName('CADASTRO').Value :=
        Trim(FmCadastro1.MeCadastro.Text)
    else
      CDSContaReceberCons.Params.ParamByName('CADASTRO').Value := null;
    if Trim(METitulo.Text) <> '' then
      CDSContaReceberCons.Params.ParamByName('NUM_TITULO').Value :=
        Trim(METitulo.Text)
    else
      CDSContaReceberCons.Params.ParamByName('NUM_TITULO').Value := null;
    if Trim(FmDtEmissao.MeDtInicial.Text) <> '' then
      CDSContaReceberCons.Params.ParamByName('DT_EMISSAO_I').Value :=
        StrToDate(Trim(FmDtEmissao.MeDtInicial.Text))
    else
      CDSContaReceberCons.Params.ParamByName('DT_EMISSAO_I').Value := null;
    if Trim(FmDtEmissao.MeDtFinal.Text) <> '' then
      CDSContaReceberCons.Params.ParamByName('DT_EMISSAO_F').Value :=
        StrToDate(Trim(FmDtEmissao.MeDtFinal.Text))
    else
      CDSContaReceberCons.Params.ParamByName('DT_EMISSAO_F').Value := null;
    if Trim(FmDtVencimento.MeDtInicial.Text) <> '' then
      CDSContaReceberCons.Params.ParamByName('DT_VENCIMENTO_I').Value :=
        StrToDate(Trim(FmDtVencimento.MeDtInicial.Text))
    else
      CDSContaReceberCons.Params.ParamByName('DT_VENCIMENTO_I').Value := null;
    if Trim(FmDtVencimento.MeDtFinal.Text) <> '' then
      CDSContaReceberCons.Params.ParamByName('DT_VENCIMENTO_F').Value :=
        StrToDate(Trim(FmDtVencimento.MeDtFinal.Text))
    else
      CDSContaReceberCons.Params.ParamByName('DT_VENCIMENTO_F').Value := null;
    CDSContaReceberCons.Open; 
    CDSContaReceberCons.First;

    //Resolve o problema do dbgrid ao clicar no checkbox do primeiro registro
    DBTitulos.SelectedIndex := DBTitulos.SelectedIndex + 1;
  end;
end;

procedure TFContaRecConsBordero.DBTitulosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if Column.FieldName = 'CHECADO' then
  begin
    DBTitulos.Canvas.FillRect(Rect);
    if DMBordero.CDSContaReceberConsCHECADO.Value = 'SIM' then
      ILChecks.Draw(DBTitulos.Canvas, Rect.Left + 5, Rect.Top + 1, 0)
    else
      ILChecks.Draw(DBTitulos.Canvas, Rect.Left + 5, Rect.Top + 1, 1);
  end;
end;

procedure TFContaRecConsBordero.DBTitulosCellClick(Column: TColumn);
var
  recNumber :Integer;
begin
  with DMBordero do
    if ((Column <> Nil) and (Column.FieldName = 'CHECADO')) then
    begin
      if (not CDSContaReceberCons.IsEmpty) then
      begin
        //recNumber := CDSContaReceberCons.RecNo;
        //CDSContaReceberCons.First;

        {while not CDSContaReceberCons.Eof do
        begin
          if not (CDSContaReceberCons.State in [DsEdit, DsInsert]) then
            CDSContaReceberCons.Edit;
          CDSContaReceberConsCHECADO.Value := 'NAO';
          CDSContaReceberCons.Next;
          if CDSContaReceberCons.State in [DsEdit, DsInsert] then
            CDSContaReceberCons.Post;
        end;}
        //CDSContaReceberCons.RecNo := recNumber;
        InverteSelecaoItem;
        //AdicionaItemNota;
      end;
      try
        DBTitulos.SelectedIndex := DBTitulos.SelectedIndex + 1;
      except
      end;
      //CDSContaReceberCons.RecNo := recNumber;
    end;
end;

procedure TFContaRecConsBordero.InverteSelecaoItem;
begin
  if DMBordero.CDSContaReceberConsCHECADO.Value = 'SIM' then
    SetSelecaoItem('NAO')
  else
    SetSelecaoItem('SIM');
end;

procedure TFContaRecConsBordero.SetSelecaoItem(Sel: String);
begin
  try
    if (DMBordero.CDSContaReceberConsCHECADO.Value <> Sel) then
    begin
      if not (DMBordero.CDSContaReceberCons.State in [DsEdit, DsInsert]) then
        DMBordero.CDSContaReceberCons.Edit;
      DMBordero.CDSContaReceberConschecado.Value := Sel;
      if DMBordero.CDSContaReceberCons.State in [DsEdit, DsInsert] then
        DMBordero.CDSContaReceberCons.Post;
    end;
  except
    Raise;
  end;
end;


procedure TFContaRecConsBordero.FormActivate(Sender: TObject);
begin
  FmFilial1.MeFilial.Text :=
    IntToStr(DMUsuario.CodFilialUsuario);
  FmFilial1.MeFilialExit(Sender);
end;

end.
