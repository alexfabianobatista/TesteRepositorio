unit UPrincipal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, math;

type
  TFPrincipal = class(TForm)
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    RadioButton6: TRadioButton;
    RadioButton7: TRadioButton;
    RadioButton8: TRadioButton;
    RadioButton9: TRadioButton;
    RadioButton10: TRadioButton;
    RadioButton11: TRadioButton;
    RadioButton12: TRadioButton;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    GroupBox2: TGroupBox;
    RadioButton13: TRadioButton;
    RadioButton14: TRadioButton;
    RadioButton15: TRadioButton;
    RadioButton16: TRadioButton;
    RadioButton17: TRadioButton;
    RadioButton18: TRadioButton;
    RadioButton19: TRadioButton;
    RadioButton20: TRadioButton;
    RadioButton21: TRadioButton;
    RadioButton22: TRadioButton;
    RadioButton23: TRadioButton;
    RadioButton24: TRadioButton;
    Panel13: TPanel;
    Panel14: TPanel;
    Panel15: TPanel;
    Panel16: TPanel;
    Panel17: TPanel;
    Panel18: TPanel;
    Panel19: TPanel;
    Panel20: TPanel;
    Panel21: TPanel;
    Panel22: TPanel;
    Panel23: TPanel;
    Panel24: TPanel;
    GroupBox3: TGroupBox;
    RadioButton25: TRadioButton;
    RadioButton26: TRadioButton;
    RadioButton27: TRadioButton;
    RadioButton28: TRadioButton;
    RadioButton29: TRadioButton;
    RadioButton30: TRadioButton;
    RadioButton31: TRadioButton;
    RadioButton32: TRadioButton;
    RadioButton33: TRadioButton;
    RadioButton34: TRadioButton;
    RadioButton35: TRadioButton;
    RadioButton36: TRadioButton;
    Panel25: TPanel;
    Panel26: TPanel;
    Panel27: TPanel;
    Panel28: TPanel;
    Panel29: TPanel;
    Panel30: TPanel;
    Panel31: TPanel;
    Panel32: TPanel;
    Panel33: TPanel;
    Panel34: TPanel;
    Panel35: TPanel;
    Panel36: TPanel;
    GroupBox4: TGroupBox;
    RadioButton37: TRadioButton;
    RadioButton38: TRadioButton;
    RadioButton39: TRadioButton;
    RadioButton40: TRadioButton;
    RadioButton41: TRadioButton;
    RadioButton42: TRadioButton;
    RadioButton43: TRadioButton;
    RadioButton44: TRadioButton;
    RadioButton45: TRadioButton;
    RadioButton46: TRadioButton;
    RadioButton47: TRadioButton;
    RadioButton48: TRadioButton;
    Panel37: TPanel;
    Panel38: TPanel;
    Panel39: TPanel;
    Panel40: TPanel;
    Panel41: TPanel;
    Panel42: TPanel;
    Panel43: TPanel;
    Panel44: TPanel;
    Panel45: TPanel;
    Panel46: TPanel;
    Panel47: TPanel;
    Panel48: TPanel;
    GroupBox5: TGroupBox;
    RadioButton49: TRadioButton;
    RadioButton50: TRadioButton;
    RadioButton51: TRadioButton;
    RadioButton52: TRadioButton;
    RadioButton53: TRadioButton;
    RadioButton54: TRadioButton;
    RadioButton55: TRadioButton;
    RadioButton56: TRadioButton;
    RadioButton57: TRadioButton;
    RadioButton58: TRadioButton;
    RadioButton59: TRadioButton;
    RadioButton60: TRadioButton;
    Panel49: TPanel;
    Panel50: TPanel;
    Panel51: TPanel;
    Panel52: TPanel;
    Panel53: TPanel;
    Panel54: TPanel;
    Panel55: TPanel;
    Panel56: TPanel;
    Panel57: TPanel;
    Panel58: TPanel;
    Panel59: TPanel;
    Panel60: TPanel;
    BitBtn1: TBitBtn;
    pnlResistor: TPanel;
    pnlFx1: TPanel;
    pnlFx2: TPanel;
    pnlFx3: TPanel;
    pnlFx4: TPanel;
    pnlFx5: TPanel;
    Label1: TLabel;
    lblNumFaixas: TLabel;
    RGUnidade: TRadioGroup;
    Label3: TLabel;
    lblValor: TLabel;
    GroupBox6: TGroupBox;
    RadioButton61: TRadioButton;
    RadioButton62: TRadioButton;
    RadioButton63: TRadioButton;
    RadioButton64: TRadioButton;
    RadioButton65: TRadioButton;
    RadioButton66: TRadioButton;
    RadioButton67: TRadioButton;
    RadioButton68: TRadioButton;
    RadioButton69: TRadioButton;
    RadioButton70: TRadioButton;
    RadioButton71: TRadioButton;
    RadioButton72: TRadioButton;
    Panel61: TPanel;
    Panel62: TPanel;
    Panel63: TPanel;
    Panel64: TPanel;
    Panel65: TPanel;
    Panel66: TPanel;
    Panel67: TPanel;
    Panel68: TPanel;
    Panel69: TPanel;
    Panel70: TPanel;
    Panel71: TPanel;
    Panel72: TPanel;
    pnlFx6: TPanel;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPrincipal: TFPrincipal;

implementation

{$R *.DFM}

procedure TFPrincipal.BitBtn1Click(Sender: TObject);
var i : integer;
begin
  for i:=0 to FPrincipal.ComponentCount-1 do
    if FPrincipal.Components[i].ClassName = 'TRadioButton' then
      TRadioButton(FPrincipal.Components[i]).Checked := false;


  pnlFx1.Visible := false;
  pnlFx2.Visible := false;
  pnlFx3.Visible := false;
  pnlFx4.Visible := false;
  pnlFx5.Visible := false;
  pnlFx6.Visible := false;


  lblNumFaixas.caption := '0';
  lblValor.Caption := '';
end;

procedure TFPrincipal.FormCreate(Sender: TObject);
begin
  BitBtn1.Click;
end;

function getPanelFaixa(tag : integer) : TPanel;
var i : integer;
begin
  result := nil;
  for i:=0 to FPrincipal.ComponentCount-1 do
  begin
    if FPrincipal.Components[i].ClassName = 'TPanel' then
    begin
      if TPanel(FPrincipal.Components[i]).parent.name = 'pnlResistor' then  //significa que são os panels da faixa
      begin
        if TPanel(FPrincipal.Components[i]).tag = tag then
        begin
          result := TPanel(FPrincipal.Components[i]);
          break;
        end;
      end;
    end;
  end;
end;


function getPanelCor(tag : integer) : TPanel;
var i : integer;
begin
  result := nil;
  for i:=0 to FPrincipal.ComponentCount-1 do
  begin
    if FPrincipal.Components[i].ClassName = 'TPanel' then
    begin
      if TPanel(FPrincipal.Components[i]).parent.Name = 'GroupBox1' then  //significa que são os panels da faixa
      begin
        if TPanel(FPrincipal.Components[i]).tag = tag then
        begin
          result := TPanel(FPrincipal.Components[i]);
          break;
        end;
      end;
    end;
  end;
end;

procedure TFPrincipal.RadioButton1Click(Sender: TObject);
var r : TRadioButton;
    pnlFaixa : TPanel;
    pnlCor   : TPanel;
    cont     : integer;
    wAux     : string; 
begin
  if Sender.ClassName = 'TRadioButton' then
  begin
    r := TRadioButton(Sender);
    pnlFaixa := getPanelFaixa(r.Parent.Tag);
    pnlCor := getPanelCor(r.Tag);

    pnlFaixa.Color := pnlCor.color;
    pnlFaixa.Visible := true;
    pnlFaixa.HelpContext := pnlCor.Tag; //joga o numbero da tag da cor escolhida nessa propriedade. (gambi)

    pnlFaixa.Hint := r.Caption;
    pnlFaixa.ShowHint := true;
  end;

  cont := 0;

  if pnlFx1.Visible then
    cont := cont + 1;

  if pnlFx2.Visible then
    cont := cont + 1;

  if pnlFx3.Visible then
    cont := cont + 1;

  if pnlFx4.Visible then
    cont := cont + 1;

  if pnlFx5.Visible then
    cont := cont + 1;

  if pnlFx6.Visible then
    cont := cont + 1;

  lblNumFaixas.Caption := inttostr(cont);

  if (cont = 3) or (cont = 4) then
  begin
    wAux := inttostr(pnlFx1.HelpContext-1);
    wAux := wAux + inttostr(pnlFx2.HelpContext-1);
    wAux := wAux + copy(FloatToStr(power(10, pnlFx3.HelpContext-1)),2,length(floattostr(power(10,pnlFx3.HelpContext-1)))-1);

//    if sender <> RGUnidade then
//    begin
//      while RGUnidade.ItemIndex < 3 do
//      begin
//        if strtofloat(wAux) >= 1000 then
//        begin
//          wAux := floattostr(strtofloat(wAux) / 1000);
//          RGUnidade.ItemIndex := RGUnidade.ItemIndex + 1;
//        end
//        else
//          break;
//      end;
//    end;

  end;

  if (cont = 5) or (cont = 6) then
  begin
    wAux := inttostr(pnlFx1.HelpContext-1);
    wAux := wAux + inttostr(pnlFx2.HelpContext-1);
    wAux := wAux + inttostr(pnlFx3.HelpContext-1);

    wAux := wAux + copy(FloatToStr(power(10, pnlFx4.HelpContext-1)),2,length(floattostr(power(10,pnlFx4.HelpContext-1)))-1);

//    if sender <> RGUnidade then
//    begin
//      while RGUnidade.ItemIndex < 3 do
//      begin
//        if strtofloat(wAux) >= 1000 then
//        begin
//          wAux := floattostr(strtofloat(wAux) / 1000);
//          RGUnidade.ItemIndex := RGUnidade.ItemIndex + 1;
//        end
//        else
//          break;
//      end;
//    end;

  end;

  if wAux <> '' then
    lblValor.Caption := formatfloat('#,##0.##########', strtofloat(waux)/power(10, RGUnidade.ItemIndex * 3) ) + ' ' + RGUnidade.Items.Strings[RGUnidade.Itemindex];

end;

end.
